<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--用户数据-->
      <el-col :span="24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
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
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="parentUserList" @sort-change='sortTableFun'>
          <el-table-column label="用户ID" align="center" key="userId" prop="userId" sortable="custom"/>
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
          <el-table-column label="推广人数" align="center" key="childCnt" prop="childCnt" sortable="custom"/>
          <el-table-column label="总佣金" align="center" key="totalCommissionMoney" prop="totalCommissionMoney" sortable="custom"/>
          <el-table-column label="佣金余额" align="center" key="remainCommissionMoney" prop="remainCommissionMoney"/>
<!--          <el-table-column label="上级用户" align="center" prop="parentUserId">-->
<!--            <template slot-scope="scope">-->
<!--              <span v-if="scope.row.parentUserId != null">{{ scope.row.parentNickName }}(<span style="color: blue">{{ scope.row.parentUserId }}</span>)</span>-->
<!--            </template>-->
<!--          </el-table-column>-->
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                title="下级列表"
                type="info"
                icon="el-icon-key"
                circle
                @click="showAgentDetailList(scope.row)"
              ></el-button>
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

    <el-dialog :title="agent.title" :visible.sync="agent.open" width="1400px" append-to-body>
      <el-table v-loading="agent.loading" :data="agentUserList">
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
        <el-table-column label="产生佣金" align="center" prop="generateCommissionMoney" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              title="详细统计"
              type="info"
              icon="el-icon-burger"
              circle
              @click="showUserFlowDetailList(scope.row)"
            ></el-button>
            <el-button
              title="投注记录"
              type="info"
              icon="el-icon-burger"
              circle
              @click="showUserBetDetailList(scope.row)"
            ></el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="agent.total>0"
        :total="agent.total"
        :page.sync="agent.queryParams.pageNum"
        :limit.sync="agent.queryParams.pageSize"
        @pagination="getAgentUserList"
      />
    </el-dialog>

    <el-dialog :title="userFlowMoney.title" :visible.sync="userFlowMoney.open" width="1400px" append-to-body>
      <user-flow-money-list :user="userFlowMoney.user"/>
    </el-dialog>

    <el-dialog :title="userBet.title" :visible.sync="userBet.open" width="1400px" append-to-body>
      <bet-real-time :user="userBet.user"/>
    </el-dialog>
  </div>
</template>

<script>
import {listAgentUser, parentUserList} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import UserFlowMoneyList from "@/views/system/userMoney"
import BetRealTime from "@/views/system/bet/betRealTime"

export default {
  name: "AgentUser",
  dicts: ['sys_normal_disable', 'sys_user_sex', 'user_type'],
  components: { Treeselect,UserFlowMoneyList,BetRealTime},
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
      parentUserList: null,
      agentUserList:null,
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
        userId: undefined,
        nickName: undefined,
        orderByColumn:"userId",
        isAsc:"asc",
        // phonenumber: undefined,
        // status: undefined,
        // deptId: undefined
      },
      agent: {
        // 遮罩层
        loading: true,
        // 弹出层标题
        title: "下级列表",
        // 是否显示弹出层
        open: false,
        // 总条数
        total: 0,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          parentUserId: undefined,
        },
      },
      userFlowMoney: {
        // 遮罩层
        loading: true,
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,

        user: {
          userId:undefined
        },
      },
      userBet: {
        // 遮罩层
        loading: true,
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        user: {
          userId: undefined
        },
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
      parentUserList(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.parentUserList = response.rows;
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
    showAgentDetailList(row){
      this.agent.queryParams.parentUserId = row.userId;
      this.getAgentUserList();
    },
    /** 查询用户列表 */
    getAgentUserList() {
      this.agent.loading = true;
      listAgentUser(this.agent.queryParams).then(response => {
          this.agentUserList = response.rows;
          this.agent.total = response.total;
          this.agent.loading = false;
          this.agent.open = true;
        }
      );
    },
    showUserFlowDetailList(row){
      this.userFlowMoney.open = true;
      this.userFlowMoney.user = {};
      this.userFlowMoney.user.userId = row.userId;
    },
    showUserBetDetailList(row){
      this.userBet.open = true;
      this.userBet.user = {};
      this.userBet.user.userId = row.userId;
    },
    sortTableFun(data) {
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
