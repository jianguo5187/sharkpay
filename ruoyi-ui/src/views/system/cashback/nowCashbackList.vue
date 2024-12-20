<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <span style="font-weight: bold">实时反水记录</span>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="nowCashBackDetailList">
      <el-table-column label="用户ID" align="center" key="userId" prop="userId"/>
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span><span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span>{{ scope.row.nickName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="头像" align="center" prop="avatar" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.avatar" :width="50" :height="50" v-if="scope.row.avatar != null && scope.row.avatar != ''"/>
        </template>
      </el-table-column>
      <el-table-column label="余额" align="center" prop="amount"/>
      <el-table-column label="充值" align="center" prop="upMoneyTotal"/>
      <el-table-column label="投注" align="center" prop="totalBetMoney"/>
      <el-table-column label="中奖" align="center" prop="betWinMoneyTotal"/>
      <el-table-column label="盈亏(正=平台输)" align="center" prop="winMoney"/>
      <el-table-column label="反水情况" align="center" prop="preCashBackMoney"/>
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
import {
  listNowCashBackDetail
} from "@/api/system/userWin";
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
      nowCashBackDetailList: [],
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
        orderByColumn:"userId",
        isAsc:"asc",
        userId: undefined,
        nickName: undefined,
        cashBackStatus: null,
        includeTestUserFlg:false,
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listNowCashBackDetail(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.nowCashBackDetailList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    sortTableFun(data) {
      console.log('sortTableFun');
      const { prop, order } = data
      //排序列
      this.queryParams.orderByColumn=prop;
      //排序顺序ascending或descending
      this.queryParams.isAsc=order;
      //返回第一页
      this.queryParams.pageNum=1;
      this.getList();
    },
  }
};
</script>
