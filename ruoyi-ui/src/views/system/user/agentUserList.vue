<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--用户数据-->
      <el-col :span="24" :xs="24">
<!--        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">-->
<!--          <el-form-item label="用户昵称" prop="nickName">-->
<!--            <el-input-->
<!--              v-model="queryParams.nickName"-->
<!--              placeholder="请输入用户昵称"-->
<!--              clearable-->
<!--              style="width: 240px"-->
<!--              @keyup.enter.native="handleQuery"-->
<!--            />-->
<!--          </el-form-item>-->
<!--          <el-form-item label="手机号码" prop="phonenumber">-->
<!--            <el-input-->
<!--              v-model="queryParams.phonenumber"-->
<!--              placeholder="请输入手机号码"-->
<!--              clearable-->
<!--              style="width: 240px"-->
<!--              @keyup.enter.native="handleQuery"-->
<!--            />-->
<!--          </el-form-item>-->
<!--          <el-form-item label="状态" prop="status">-->
<!--            <el-select-->
<!--              v-model="queryParams.status"-->
<!--              placeholder="用户状态"-->
<!--              clearable-->
<!--              style="width: 240px"-->
<!--            >-->
<!--              <el-option-->
<!--                v-for="dict in dict.type.sys_normal_disable"-->
<!--                :key="dict.value"-->
<!--                :label="dict.label"-->
<!--                :value="dict.value"-->
<!--              />-->
<!--            </el-select>-->
<!--          </el-form-item>-->
<!--          <el-form-item label="创建时间">-->
<!--            <el-date-picker-->
<!--              v-model="dateRange"-->
<!--              style="width: 240px"-->
<!--              value-format="yyyy-MM-dd"-->
<!--              type="daterange"-->
<!--              range-separator="-"-->
<!--              start-placeholder="开始日期"-->
<!--              end-placeholder="结束日期"-->
<!--            ></el-date-picker>-->
<!--          </el-form-item>-->
<!--          <el-form-item>-->
<!--            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--          </el-form-item>-->
<!--        </el-form>-->

        <el-row :gutter="10" class="mb8">
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="agentUserList">
          <el-table-column label="用户昵称" align="center" prop="userId">
            <template slot-scope="scope">
              <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
            </template>
          </el-table-column>
          <el-table-column label="总佣金金额" align="center" key="totalCommissionMoney" prop="totalCommissionMoney"/>
          <el-table-column label="今日佣金金额" align="center" key="todayCommissionMoney" prop="todayCommissionMoney"/>
          <el-table-column label="上级用户" align="center" prop="parentUserId">
            <template slot-scope="scope">
              <span v-if="scope.row.parentUserId != null">{{ scope.row.parentNickName }}(<span style="color: blue">{{ scope.row.parentUserId }}</span>)</span>
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
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {listAgentUser} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "AgentUser",
  dicts: ['sys_normal_disable', 'sys_user_sex', 'user_type'],
  components: { Treeselect },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户表格数据
      agentUserList: null,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 表单参数
      form: {},
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        // nickName: undefined,
        // phonenumber: undefined,
        // status: undefined,
        // deptId: undefined
      },
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      listAgentUser(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.agentUserList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
  }
};
</script>
