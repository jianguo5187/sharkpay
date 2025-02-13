<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="用户ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}" @keyup.enter.native="handleQuery">
        </el-input>
      </el-form-item>
      <el-form-item label="用户昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户昵称"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
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

      <el-form-item label="反水状态" prop="status">
        <el-select v-model="queryParams.cashBackStatus" placeholder="请选择反水状态" clearable @change="handleQuery">
          <el-option
            v-for="dict in dict.type.sys_cashback_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="包含测试用户" prop="includeTestUserFlg">
        <el-switch v-model="queryParams.includeTestUserFlg" @change="getList"></el-switch>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          size="mini"
          @click="handleCashBackYestoday"
        >发放昨日用户流水反点</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cashBackDetailList" show-summary :summary-method="getSummaries">
      <el-table-column label="用户ID" align="center" key="userId" prop="userId"/>
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span><span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span>{{ scope.row.nickName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="日期" align="center" prop="winTime" />
      <el-table-column label="游戏名" align="center" prop="gameName" />
      <el-table-column label="流水" align="center" prop="totalBetMoney" />
      <el-table-column label="盈亏金额" align="center" prop="winMoney" />
      <el-table-column label="流水反点" align="center" prop="cashBackMoney" >
        <template slot-scope="scope">
          <span v-if="scope.row.cashBackMoney > 0">{{ scope.row.cashBackMoney }}</span>
          <span v-else>{{ scope.row.preCashBackMoney }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="cashBackStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_cashback_status" :value="scope.row.cashBackStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="备注(返点率)" align="center" prop="cashBackRate">
        <template slot-scope="scope">
          {{ scope.row.cashBackRate }}%
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
            v-if="scope.row.winTime < todayTime && scope.row.cashBackStatus == '0'"
            @click="handleCashBack(scope.row)"
          >反水</el-button>
        </template>
      </el-table-column>
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
import {cashBackUser, cashBackYestoday, listCashBackDetail} from "@/api/system/userWin";
import {selectAllUser} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "cashback",
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
      cashBackDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      userListOptions:[],
      todayTime:"",
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: undefined,
        nickName: undefined,
        cashBackStatus: null,
        includeTestUserFlg:false,
      },
    };
  },
  created() {
    this.getList();
    let isDate = new Date();
    this.todayTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate()}`;
  },
  // mounted() {
  //   setInterval(this.getList, 15000); //每15s刷新列表
  // },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listCashBackDetail(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.cashBackDetailList = response.rows;
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
        } else if(index >2 && index <5){
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
        } else if(column.property == "cashBackMoney"){
          //如果是经费（正常的加减法）
          const values = data.map((item) => Number(item[column.property])>0?Number(item[column.property]):Number(item["preCashBackMoney"]));
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
    handleCashBackYestoday() {
      this.$modal.confirm("是否发放昨日用户流水反点?（发放完不可取消）").then(function() {
        return cashBackYestoday();
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getUserList();
      }).catch(() => {});
    },
    handleCashBack(row){
      console.log('handleCashBack');
      this.$modal.confirm("是否发放用户[" + row.nickName +"]流水反点?（发放完不可取消）").then(function() {
        return cashBackUser({winTime:row.winTime + " 00:00:00",userId:row.userId,gameId:row.gameId});
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getUserList();
      }).catch(() => {});
    },
  }
};
</script>
