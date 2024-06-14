<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="用户" prop="userId">
        <treeselect
          v-model="queryParams.userId"
          :options="userListOptions"
          :normalizer="normalizer"
          :show-count="true"
          placeholder="请选择用户"
          style="width: 320px;"/>
      </el-form-item>


      <el-form-item label="筛选时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cashBackList" show-summary :summary-method="getSummaries">
      <el-table-column label="用户名" align="center" prop="userId">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
        </template>
      </el-table-column>
      <el-table-column label="用户备注名" align="center" key="remarkName" prop="remarkName"/>
      <el-table-column label="日期" align="center" prop="winTime" />
      <el-table-column label="返点金额" align="center" prop="cashBackMoney" />
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import {cashBackUser, cashBackYestoday, listCashBackDetail, listCashBackList} from "@/api/system/userWin";
import {selectAllUser} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "cashbackList",
  components: {Treeselect},
  dicts: ['sys_cashback_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
      // 登录用户Name
      loginUserName: this.$store.state.user.name,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户盈利表格数据
      cashBackList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      userListOptions:[],
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: null,
      },
    };
  },
  created() {
    this.getUserList();
  },
  // mounted() {
  //   setInterval(this.getList, 15000); //每15s刷新列表
  // },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listCashBackList(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.cashBackList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getUserList(){
      selectAllUser().then(response => {
        this.userListOptions = [];
        const menu = { userId: this.loginUserId, nickName: this.loginUserName, children: [] };
        menu.children = this.handleTree(response.rows, "userId", "parentUserId");
        this.userListOptions.push(menu);
        this.getList();
      });
    },
    /** 转换菜单数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.userId,
        label: node.nickName,
        children: node.children
      };
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 合计 指定某一列添加合计
    getSummaries(param) {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = "合计";
          return;
        } else if(index >1){
          //如果是经费（正常的加减法）
          const values = data.map((item) => Number(item[column.property]));
          // console.log(values);
          if (!values.every((value) => isNaN(value))) {
            sums[index] = values.reduce((prev, curr) => {
              const value = Number(curr);
              var sum = 0;
              if (!isNaN(value)) {
                sum = Number(Number(prev) + Number(curr)).toFixed(2);
                return sum;
              } else {
                return prev;
              }
            }, 0);
            sums[index] += " ";
          }
        }
      });
      return sums;
    },
  }
};
</script>
