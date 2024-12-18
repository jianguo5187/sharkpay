<template>
  <div class="app-container">
    <el-form :model="queryParams" :rules="rules"  ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row :gutter="20">
        <el-form-item label="游戏" prop="gameId">
          <el-select v-model="queryParams.gameId" placeholder="请选择游戏">
            <el-option
              clearable
              v-for="item in gameListOptions"
              :key="item.gameId"
              :label="item.gameName"
              :value="item.gameId"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-row>
      <el-row :gutter="20">
        <el-form-item label="期数" prop="periods">
          <el-input
            v-model="queryParams.periods"
            placeholder="请输入期数"
            clearable
          />
        </el-form-item>
      </el-row>

      <el-row>
        <el-form-item>
          <el-button type="primary" size="mini" @click="handleBetCancel">提交</el-button>
        </el-form-item>
        <el-form-item>
          <el-button size="mini" @click="handleBack">返回</el-button>
        </el-form-item>
      </el-row>
    </el-form>
  </div>
</template>

<script>
import {getValidGame} from "@/api/system/game";
import {adminCancelNoSettleBetRecord} from "@/api/system/bet";

export default {
  name: "Payment",
  dicts: ['sys_payment_status', 'sys_payment_type'],
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
      // 支付方式表格数据
      paymentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      // 查询参数
      queryParams: {
        gameId: null,
        isRobot: "0",
        isDelete: "0",
        settleFlg: "0",
        periods: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏不能为空", trigger: "blur" },
        ],
        periods: [
          { required: true, message: "期数不能为空", trigger: "blur" },
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        if(response.gameList.length > 0){
          this.queryParams.gameId = response.gameList[0].gameId
        }
      });
    },
    handleBack(){
      this.$router.push({ path: "/game/game/betItem" });
    },
    handleBetCancel(){
      this.$refs["queryForm"].validate(valid => {
        if(valid){
          adminCancelNoSettleBetRecord(this.queryParams).then(response => {
            this.$modal.msgSuccess("手动撤单成功");
            this.queryParams.periods = null;
          });
        }
      });
    },
  }
};
</script>
