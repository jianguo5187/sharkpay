<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
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

      <el-form-item label="类型" prop="type">
        <el-select
          v-model="queryParams.type"
          placeholder="类型"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_user_money_type"
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userFlowList">
      <el-table-column label="序号" align="center" prop="id" />
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
      <el-table-column label="变动之前" align="center" prop="beforeUserMoney" />
      <el-table-column label="金额变动" align="center" prop="cashMoney" />
      <el-table-column label="变动之后" align="center" prop="userBalance" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_money_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="记录时间" align="center" prop="cashTime" />
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
import {agreeApply, refuseApply, listUserFlowMoney} from "@/api/system/recharge";
import {getValidGame} from "@/api/system/game";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {selectAllUser} from "@/api/system/user";

export default {
  name: "UserFlowMoneyList",
  components: {Treeselect},
  dicts: ['sys_user_money_type'],
  props: {
    user: {
      type: Object
    }
  },
  data() {
    return {
      // 遮罩层
      loading: false,
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
      // 投注机器人表格数据
      userFlowList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: undefined,
        nickName: undefined,
        type: null,
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
    this.getList();
  },
  watch: {
    user: {
      handler(user) {console.log("watch")
        if (user) {
          this.queryParams.userId = user.userId;
          this.dateRange = user.dateRange;
          this.getList();
        }
      },
      immediate: true
    }
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      console.log("userMoney")
      listUserFlowMoney(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.userFlowList = response.rows;
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
    reset(){
      this.resetForm("queryForm");
      this.userFlowList = [];
      this.total = 0;
    },
  }
};
</script>
