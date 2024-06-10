<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="totalReportList">
      <el-table-column label="日期" align="center" prop="calendarDate" />
      <el-table-column label="注册人数" align="center" prop="createUserCnt" />
      <el-table-column label="投注人数" align="center" prop="betCnt" />
      <el-table-column label="上分" align="center" prop="upMoneyTotal" />
      <el-table-column label="签到" align="center" prop="signMoneyTotal" />
      <el-table-column label="下分" align="center" prop="downMoneyTotal" />
      <el-table-column label="已反水" align="center" prop="cashBackMoneyTotal" />
      <el-table-column label="待反水" align="center" prop="noCashBackMoneyTotal" />
      <el-table-column label="投注" align="center" prop="betMoneyTotal" />
      <el-table-column label="中奖" align="center" prop="betWinMoneyTotal" />
      <el-table-column label="佣金" align="center" prop="commissionMoneyTotal" />
      <el-table-column label="平台盈亏" align="center" prop="winMoneyTotal" />
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
import {listTotalReport} from "@/api/system/userWin";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "totalReport",
  components: {Treeselect},
  dicts: ['sys_postal_status'],
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
      totalReportList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listTotalReport(this.queryParams).then(response => {
        this.totalReportList = response.rows;
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
  }
};
</script>
