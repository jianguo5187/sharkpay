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
        <el-form-item>
          <el-button type="success" icon="el-icon-edit" size="mini" @click="handleGameRepair">修复数据</el-button>
        </el-form-item>
      </el-row>

      <el-form-item label="期数" prop="periods">
        <el-input
          v-model="queryParams.periods"
          placeholder="请输入期数"
          clearable
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleBetKj">手动开奖</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {getValidGame} from "@/api/system/game";
import {handleLottery, repair} from "@/api/system/betkj";

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
        periods: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏不能为空", trigger: "blur" },
        ],
        // periods: [
        //   { required: true, message: "期数不能为空", trigger: "blur" },
        // ],
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
    handleGameRepair(){
      repair({gameId:this.queryParams.gameId}).then(response => {
        this.$modal.msgSuccess("手动修复数据成功");
      });
    },
    handleBetKj(){
      this.$refs["queryForm"].validate(valid => {
        if(valid){
          handleLottery(this.queryParams).then(response => {
            this.$modal.msgSuccess("手动开奖成功");
            this.queryParams.periods = null;
          });
        }
      });
    },
  }
};
</script>
