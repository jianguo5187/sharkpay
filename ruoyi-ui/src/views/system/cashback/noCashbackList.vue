<template>
  <div class="app-container">
<!--    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">-->
<!--      <el-form-item label="用户ID" prop="userId">-->
<!--        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}" @keyup.enter.native="handleQuery">-->
<!--        </el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="用户昵称" prop="nickName">-->
<!--        <el-input-->
<!--          v-model="queryParams.nickName"-->
<!--          placeholder="请输入用户昵称"-->
<!--          clearable-->
<!--          style="width: 240px"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

<!--      <el-form-item label="筛选时间">-->
<!--        <el-date-picker-->
<!--          v-model="dateRange"-->
<!--          style="width: 240px"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          type="daterange"-->
<!--          range-separator="-"-->
<!--          start-placeholder="开始日期"-->
<!--          end-placeholder="结束日期"-->
<!--        ></el-date-picker>-->
<!--      </el-form-item>-->

<!--      <el-form-item label="反水状态" prop="status">-->
<!--        <el-select v-model="queryParams.cashBackStatus" placeholder="请选择反水状态" clearable @change="handleQuery">-->
<!--          <el-option-->
<!--            v-for="dict in dict.type.sys_cashback_status"-->
<!--            :key="dict.value"-->
<!--            :label="dict.label"-->
<!--            :value="dict.value"-->
<!--          />-->
<!--        </el-select>-->
<!--      </el-form-item>-->

<!--      <el-form-item label="包含测试用户" prop="includeTestUserFlg">-->
<!--        <el-switch v-model="queryParams.includeTestUserFlg" @change="getList"></el-switch>-->
<!--      </el-form-item>-->

<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <span style="font-weight: bold">{{yestodayTime}} 以及之前待反水记录</span>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          size="mini"
          @click="handleAllCashBack"
        >全部反水</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="noCashBackDetailList" @sort-change='sortTableFun'>
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
      <el-table-column label="余额" align="center" prop="amount" sortable="custom"/>
      <el-table-column label="充值" align="center" prop="upMoneyTotal" sortable="custom"/>
      <el-table-column label="投注" align="center" prop="totalBetMoney" sortable="custom"/>
      <el-table-column label="中奖" align="center" prop="betWinMoneyTotal" sortable="custom"/>
      <el-table-column label="盈亏(正=平台输)" align="center" prop="winMoney" sortable="custom"/>
      <el-table-column label="反水情况" align="center" prop="preCashBackMoney" sortable="custom"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
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
import {
  cashBackAllRecord,
  cashBackByUser,
  cashBackUser,
  cashBackYestoday,
  listNoCashBackDetail
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
      noCashBackDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      userListOptions:[],
      yestodayTime:"",
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
    let isDate = new Date();
    this.yestodayTime = `${isDate.getFullYear()}-${isDate.getMonth() + 1}-${isDate.getDate() - 1}`;
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listNoCashBackDetail(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.noCashBackDetailList = response.rows;
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
    handleAllCashBack() {
      this.$modal.confirm("确定发放用户流水反点?（发放完不可取消）").then(function() {
        return cashBackAllRecord();
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getList();
      }).catch(() => {});
    },
    handleCashBack(row){
      console.log('handleCashBack');
      this.$modal.confirm("是否发放用户[" + row.nickName +"]流水反点?（发放完不可取消）").then(function() {
        return cashBackByUser({userId:row.userId});
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getList();
      }).catch(() => {});
    },
  }
};
</script>
