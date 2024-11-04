<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      <el-form-item label="投注时间">
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
      <el-form-item label="游戏" prop="gameId">
        <el-select v-model="queryParams.gameId" placeholder="请选择游戏" @change="handleQuery">
          <el-option
            clearable
            v-for="item in gameListOptions"
            :key="item.gameId"
            :label="item.gameName"
            :value="item.gameId"
          ></el-option>
        </el-select>
      </el-form-item>
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

      <el-form-item label="期数" prop="periods">
        <el-input
          v-model="queryParams.periods"
          placeholder="请输入期数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="是否中奖" prop="winFlg">
        <el-select v-model="queryParams.winFlg" placeholder="是否中奖" clearable :style="{width: '100%'}" @change="handleQuery">
          <el-option v-for="(item, index) in winFlgOptions" :key="index" :label="item.label"
                     :value="item.value" :disabled="item.disabled"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="仅看未结算" prop="settledFlg">
        <el-switch v-model="queryParams.settledFlg" @change="handleQuery"></el-switch>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="betRealTimeList">
      <el-table-column label="序号" align="center" key="betId" prop="betId" width="80"/>
      <el-table-column label="用户ID" align="center" key="userId" prop="userId" width="80"/>
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
      <el-table-column label="下注时间" align="center" prop="recordTime" width="150"/>
      <el-table-column label="游戏名" align="center" prop="gameName" />
      <el-table-column label="期号" align="center" prop="periods" width="120"/>
      <el-table-column label="玩法" align="center" prop="playType" width="120"/>
      <el-table-column label="投注号码" align="center" prop="playDetail" width="80"/>
      <el-table-column label="投注金额" align="center" prop="money" />
      <el-table-column label="中奖金额" align="center" prop="accountResult" />
      <el-table-column label="开奖结果" align="center" prop="gameResult" />
<!--      <el-table-column label="盈亏" align="center" prop="accountResult" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.isDelete == 1">用户撤单</span>
          <span v-else-if="scope.row.isDelete == 2">管理撤单</span>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            v-else-if="scope.row.isDelete == 0 && scope.row.gameResult ==''"
            @click="handleCancel(scope.row)"
          >撤单</el-button>
          <span v-else>已结算</span>
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
import {adminCancelBetRecord, listBetRealTime} from "@/api/system/bet";
import {getValidGame} from "@/api/system/game";

export default {
  name: "BetRealTime",
  props: {
    user: {
      type: Object
    }
  },
  data() {
    return {
      // 遮罩层
      loading: true,
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
      betRealTimeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        gameId: null,
        nickName: undefined,
        settledFlgStr: null,
        periods:undefined,
        winFlg:undefined,
        settledFlg: false,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      winFlgOptions: [{
        "label": "未开奖",
        "value": 1
      }, {
        "label": "未中奖",
        "value": 2
      }, {
        "label": "中奖",
        "value": 3
      }],
    };
  },
  created() {
    this.getGameList();
  },
  mounted() {
    setInterval(this.getList, 15000); //每15s刷新列表
  },
  watch: {
    user: {
      handler(user) {console.log("watch")
        if (user) {
          this.queryParams.userId = user.userId;
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
      if(this.queryParams.settledFlg){
        this.queryParams.settledFlgStr = "0";
      }else{
        this.queryParams.settledFlgStr = null;
      }
      listBetRealTime(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.betRealTimeList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        this.getList();
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
    /** 撤单按钮操作 */
    handleCancel(row) {
      const ids = row.betId;
      this.$modal.confirmWithTilte('确认删除用户本期投注?','撤单后不可恢复').then(function() {
        return adminCancelBetRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("撤单成功");
      }).catch(() => {});
    },
  }
};
</script>
