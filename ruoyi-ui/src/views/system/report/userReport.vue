<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="记录时间">
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

      <el-form-item label="用户ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
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

      <el-form-item label="上级ID" prop="parentUserId">
        <el-input
          v-model="queryParams.parentUserId"
          placeholder="请输入上级ID"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
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
          @click="handleTodayQuery"
        >今日</el-button>
        <el-button
          type="primary"
          plain
          size="mini"
          @click="handleYesterdayQuery"
        >昨日</el-button>
        <el-button
          type="primary"
          plain
          size="mini"
          @click="handleWeekQuery"
        >本周</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="totalReportList">
      <el-table-column label="用户ID" align="center" key="userId" prop="userId"/>
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}<span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span></span>
        </template>
      </el-table-column>
      <el-table-column label="头像" align="center" prop="avatar" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.avatar" :width="50" :height="50" v-if="scope.row.avatar != null && scope.row.avatar != ''"/>
        </template>
      </el-table-column>
      <el-table-column label="上级用户ID" align="center" prop="parentUserId"/>
      <el-table-column label="投注" align="center" prop="betMoneyTotal" />
      <el-table-column label="中奖" align="center" prop="betWinMoneyTotal" />
      <el-table-column label="用户盈亏" align="center" prop="winMoneyTotal" />
      <el-table-column label="上分" align="center" prop="upMoneyTotal" />
      <el-table-column label="签到" align="center" prop="signMoneyTotal" />
      <el-table-column label="下分" align="center" prop="downMoneyTotal" />
      <el-table-column label="佣金" align="center" prop="commissionMoneyTotal" />
      <el-table-column label="已反水" align="center" prop="cashBackMoneyTotal" />
      <el-table-column label="待反水" align="center" prop="noCashBackMoneyTotal" />
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
import {listUserReport} from "@/api/system/userWin";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "userReport",
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
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: undefined,
        nickName: undefined,
        parentUserId: undefined,
        includeTestUserFlg:false,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getTodayTime();
    this.getList();
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listUserReport(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
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
    handleTodayQuery() {
      this.queryParams.pageNum = 1;
      this.getTodayTime();
      this.getList();
    },
    getTodayTime() {
      let isDate = new Date()
      let sTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate()}`
      let eTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate()}`
      sTime = `${sTime}`
      eTime = `${eTime}`
      this.dateRange= [sTime, eTime] // 显示的默认时间
    },
    handleYesterdayQuery() {
      this.queryParams.pageNum = 1;
      this.getYesterdayTime();
      this.getList();
    },
    getYesterdayTime() {
      let isDate = new Date()
      let sTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate() - 1}`
      let eTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate() - 1}`
      sTime = `${sTime}`
      eTime = `${eTime}`
      this.dateRange= [sTime, eTime] // 显示的默认时间
    },
    handleWeekQuery() {
      this.queryParams.pageNum = 1;
      this.getBeforeWeekTime();
      this.getList();
    },
    getBeforeWeekTime() {
      let isDate = new Date()
      let sTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate() - 7}`
      let eTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate() - 1}`
      sTime = `${sTime}`
      eTime = `${eTime}`
      this.dateRange= [sTime, eTime] // 显示的默认时间
    },
  }
};
</script>
