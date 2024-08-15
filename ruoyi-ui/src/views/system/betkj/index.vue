<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

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

      <el-form-item label="期数" prop="periods">
        <el-input
          v-model="queryParams.periods"
          placeholder="请输入期数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="开奖状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择开奖状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_kj_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" style="margin-left:30px;font-size: 25px">
      <el-col :span="4">
        <i class="el-icon-folder"></i> 当期：<span style="color: rgb(255, 165, 0)">{{nowPeriods}}</span>
      </el-col>
      <el-col :span="4">
        <i class="el-icon-timer"></i> 距开奖：<span style="color: rgb(255, 165, 0)">{{showBetTime}}</span> s
      </el-col>
    </el-row>
    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="betkjList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="期数" width="85" align="center" prop="periods" />
      <el-table-column label="开奖时间" align="center" prop="betOpenTime" />
      <el-table-column label="是否已经开奖" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_kj_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="开奖号码" align="center" prop="openResult" />
      <el-table-column label="下注金额" align="center" prop="countMoney" />
      <el-table-column label="中奖金额" align="center" prop="winMoney" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.systemOpenType == 'N' || scope.row.status == '1'">不能操作</span>
          <el-button
            size="mini"
            type="primary"
            round
            v-if="scope.row.systemOpenType == 'Y' && scope.row.status == '0'"
            @click="handleReOpenCode(scope.row)"
          >重开</el-button>
          <el-button
            size="mini"
            type="primary"
            round
            v-if="scope.row.systemOpenType == 'Y' && scope.row.status == '0'"
            @click="handleUpdateOpenCode(scope.row)"
          >修改</el-button>
          <el-button
            size="mini"
            type="danger"
            round
            v-if="scope.row.systemOpenType == 'Y' && scope.row.status == '0'"
            @click="handleSleepOpenCode(scope.row)"
          >延迟</el-button>
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
import {listBetkj, sleepOpenCode, reOpen, editOpenCode, getLastNoOpenRecord} from "@/api/system/betkj";
import {getValidGame} from "@/api/system/game";

export default {
  name: "Betkj",
  dicts: ['sys_kj_status'],
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
      // 开奖表格数据
      betkjList: [],
      gameListOptions:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        gameId: null,
        status: null,
        periods: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏ID不能为空", trigger: "change" }
        ],
      },
      nowPeriods: undefined,
      betTime: undefined,
      showBetTime: undefined,
      betTimer: null,
    };
  },
  created() {
    this.getGameList();
  },
  destroyed() {
    this.clearBetTimerInterval();
  },
  mounted() {
    this.betTimer = window.setInterval(() => {
      if(this.betTime != undefined){
        this.betTime--;
        this.showBetTime--;
        if(this.betTime < 0){
          this.nowPeriods = undefined;
          this.showBetTime = undefined;
          setTimeout(() => {
            this.getList();
          },2000);
        }
      }
    }, 1000)
  },
  methods: {
    clearBetTimerInterval(){
      this.betTimer = null;
      window.clearInterval(this.betTimer)
    },
    /** 查询开奖列表 */
    getList() {
      this.loading = true;
      this.nowPeriods = undefined;
      this.betTime = undefined;
      this.showBetTime = undefined;
      listBetkj(this.queryParams).then(response => {
        this.betkjList = response.rows;
        this.total = response.total;
        this.loading = false;
        this.getLastNoOpenRecord();
        console.log('listBetkj');
      });
    },
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        if(response.gameList.length > 0){
          this.queryParams.gameId = response.gameList[0].gameId
        }
        this.getList();
      });
    },
    //获取未开奖数据
    getLastNoOpenRecord(){
      getLastNoOpenRecord(this.queryParams).then(response => {
        this.nowPeriods = response.lastNoOpenRecord.periods;
        this.betTime = response.lastNoOpenRecord.betTime;
        if(this.betTime < 0){
          this.showBetTime = undefined;
        }else{
          this.showBetTime = response.lastNoOpenRecord.betTime;
        }
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 重开操作 */
    handleReOpenCode(row) {
      const gameId = row.gameId;
      const gameType = row.gameType;
      const periods = row.periods;
      this.$modal.confirm('确定重新生成一组数据').then(function() {
        console.log('handleReOpenCode');
        return reOpen({gameId:gameId,gameType:gameType,periods:periods});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("重开奖成功");
      }).catch(() => {});
    },
    /** 修改操作 */
    handleUpdateOpenCode(row) {
      const gameId = row.gameId;
      const gameType = row.gameType;
      const periods = row.periods;

      this.$prompt('请输入开奖数据，号码之间用逗号隔开', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
      }).then(({ value }) => {
        editOpenCode({gameId:gameId,gameType:gameType,periods:periods,newOpenCode:value}).then(response => {
          this.getList();
          this.$modal.msgSuccess("修改成功");
        });
      }).catch(() => {});
    },

    /** 延迟操作 */
    handleSleepOpenCode(row) {
      const gameId = row.gameId;
      const gameType = row.gameType;
      const periods = row.periods;

      this.$prompt('请输入延迟开奖秒数', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        inputPattern: /^[1-9]*[1-9][0-9]*$/,
        inputErrorMessage: "请输入数字",
      }).then(({ value }) => {
        sleepOpenCode({gameId:gameId,gameType:gameType,periods:periods,sleepSeconds:value}).then(response => {
          this.getList();
          this.$modal.msgSuccess("修改成功");
        });
      }).catch(() => {});
    },
  }
};
</script>
