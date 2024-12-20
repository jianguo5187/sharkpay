<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
<!--      <el-form-item label="用户ID" prop="userId">-->
<!--        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}" @keyup.enter.native="handleQuery">-->
<!--        </el-input>-->
<!--      </el-form-item>-->
      <el-form-item label="用户昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户昵称"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="反水时间">
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

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          size="mini"-->
<!--          @click="handleCashBackYestoday"-->
<!--        >发放昨日用户流水反点</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cashBackedDetailList">
      <el-table-column label="序号" align="center" key="rowId" prop="rowId"/>
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
      <el-table-column :label="cashBackedTotalMoney" align="center" prop="cashBackMoney"/>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="反水时间" align="center" prop="winTime" />
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
  listCashBackedDetail,
  selectCashBackedTotalMoney
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
      cashBackedDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      cashBackedTotalMoney : "",
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
  },
  // mounted() {
  //   setInterval(this.getList, 15000); //每15s刷新列表
  // },
  methods: {
    /** 查询已反水列表 */
    getList() {
      this.loading = true;
      listCashBackedDetail(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.cashBackedDetailList = response.rows;
        this.total = response.total;
        this.getCashBackedTotalMoney();
      });
    },
    getCashBackedTotalMoney() {
      this.loading = true;
      selectCashBackedTotalMoney(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.cashBackedTotalMoney = "反水额(总:" + response.cashBackedTotalMoney + ")";
        this.loading = false;
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
  }
};
</script>
