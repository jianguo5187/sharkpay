<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="用户ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}">
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
        >今日盈利</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userTotalRankList" show-summary :summary-method="getSummaries">
      <el-table-column label="用户ID" align="center" key="userId" prop="userId" width="80"/>
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}<span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span></span>
        </template>
      </el-table-column>
      <el-table-column label="余额" align="center" prop="userAmount" />
      <el-table-column
        v-for="column in gameWinMoneyColumns"
        :key="column.gameMarkId"
        :prop="column.gameMarkId"
        :label="column.gameName"
        align="center" >
      </el-table-column>
      <el-table-column label="盈亏" align="center" prop="totalWinMoney" />
      <el-table-column label="反水" align="center" prop="totalCashBackMoney" />
      <el-table-column label="流水" align="center" prop="totalBetMoney" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
            @click="handleDetailList(scope.row)"
          >详细</el-button>
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

    <el-dialog :title="title" :visible.sync="open" width="1400px" append-to-body>
      <el-table v-loading="loading" :data="userGameRankList">
        <el-table-column label="日期" align="center" prop="winTime" />
        <el-table-column label="游戏名" align="center" prop="gameName" />
        <el-table-column label="投注期数" align="center" prop="recordCount" />
        <el-table-column label="盈亏" align="center" prop="winMoney" />
        <el-table-column label="流水" align="center" prop="totalBetMoney" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="success"
              icon="el-icon-edit"
              @click="handleDateDetailList(scope.row)"
            >详细</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="userGameWintotal>0"
        :total="userGameWintotal"
        :page.sync="dialogUserGameWinQueryParams.pageNum"
        :limit.sync="dialogUserGameWinQueryParams.pageSize"
        @pagination="handleDetailList"
      />
    </el-dialog>

    <el-dialog :title="dateUserWinTitle" :visible.sync="dateUserWinOpen" width="1200px" append-to-body>
      <el-table v-loading="loading" :data="dateUserGameRankList">
        <el-table-column label="日期" align="center" prop="betOpenTime" />
        <el-table-column label="游戏名" align="center" prop="gameName" />
        <el-table-column label="期数" align="center" prop="periods" />
        <el-table-column label="开奖号码" align="center" prop="openResult" />
        <el-table-column label="投注号码" align="center" prop="betResult">
          <template slot-scope="scope">
            <div v-html="scope.row.betResult"></div>
          </template>
        </el-table-column>
        <el-table-column label="投注金额" align="center" prop="countMoney" />
        <el-table-column label="中奖金额" align="center" prop="winMoney" />
        <el-table-column label="盈亏" align="center" prop="resultMoney" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="danger"
              v-if="scope.row.isDeduct == 0"
              @click="handleUserDeduct(scope.row,'1')"
            >扣除</el-button>
            <el-button
              size="mini"
              type="warning"
              v-else
              @click="handleUserDeduct(scope.row,'0')"
            >取消</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="dateUserGameWintotal>0"
        :total="dateUserGameWintotal"
        :page.sync="dateUserGameWinQueryParams.pageNum"
        :limit.sync="dateUserGameWinQueryParams.pageSize"
        @pagination="handleDetailList"
      />
    </el-dialog>
  </div>
</template>

<script>
import {listUserGameRank, listUserTotalRank} from "@/api/system/userWin";
import {selectAllUser} from "@/api/system/user";
import {getValidGame} from "@/api/system/game";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {listUserWinGameBet, userDeduct} from "@/api/system/betkj";

export default {
  name: "userTotalRank",
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
      userTotalRankList: [],
      userGameRankList: [],
      dateUserGameRankList: [],
      // 弹出层标题
      title: "",
      dateUserWinTitle: "",
      // 是否显示弹出层
      open: false,
      dateUserWinOpen: false,
      userListOptions:[],
      // 游戏收益列表
      gameWinMoneyColumns: [],
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: undefined,
        nickName: undefined,
      },
      // 总条数
      userGameWintotal: 0,
      dialogUserGameWinQueryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: null,
      },
      // 总条数
      dateUserGameWintotal: 0,
      dateUserGameWinQueryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: null,
        gameId: null,
        recordTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getUserList();
    this.getGameList();
  },
  // mounted() {
  //   setInterval(this.getList, 15000); //每15s刷新列表
  // },
  methods: {
    getGameList(){
      getValidGame().then(response => {
        this.gameWinMoneyColumns = response.gameList;
      });
    },
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listUserTotalRank(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.userTotalRankList = response.rows;
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
        } else {
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
    handleDetailList(row){
      this.open = true;
      this.title = "彩种详情";
      this.dialogUserGameWinQueryParams.userId = row.userId;
      this.dialogUserGameWinQueryParams.pageNum = 1;
      listUserGameRank(this.addDateRange(this.dialogUserGameWinQueryParams, this.dateRange)).then(response => {
        this.userGameRankList = response.rows;
        this.userGameWintotal = response.total;
      });
    },
    handleDateDetailList(row){
      this.dateUserWinOpen = true;
      this.dateUserWinTitle = "彩种详情";
      this.dateUserGameWinQueryParams.userId = row.userId;
      this.dateUserGameWinQueryParams.gameId = row.gameId;
      this.dateUserGameWinQueryParams.recordTime = row.winTime;
      this.dateUserGameWinQueryParams.pageNum = 1;
      this.dateUserGameRankList = null;
      this.getDateDetailList();
    },
    getDateDetailList(){
      listUserWinGameBet(this.dateUserGameWinQueryParams).then(response => {
        this.dateUserGameRankList = response.rows;
        this.dateUserGameWintotal = response.total;
      });
    },
    handleUserDeduct(row,type){
      var content = '确认扣除用户当期流水?';
      if (type == 0) {
        content = '确认解除用户当期流水?';
      }
      console.log('handleUserDeduct');
      this.$modal.confirm(content).then(function() {
        return userDeduct({betRecordId:row.betRecordId,
                              gameId:row.gameId,
                              userId:row.userId,
                              recordTime:row.betOpenTime,
                              isDeduct:type}
        );
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.getDateDetailList();
      }).catch(() => {});
    },
  }
};
</script>
