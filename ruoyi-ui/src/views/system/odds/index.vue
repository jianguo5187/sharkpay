<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="游戏" prop="gameId">
        <el-select v-model="queryParams.gameId" placeholder="请选择游戏" @change="getGameOdds">
          <el-option
            clearable
            v-for="item in gameListOptions"
            :key="item.gameId"
            :label="item.gameName"
            :value="item.gameId"
          ></el-option>
        </el-select>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8" v-show="formShowFlg">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          size="medium"
          @click="submitForm"
        >保存</el-button>
      </el-col>
    </el-row>
<!--    label-width="80px"-->
    <el-form ref="form" :model="form" :rules="rules" v-show="formShowFlg">
      <el-row>
      <b>13,14大小单双特殊赔率：</b>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="金额下限" prop="numberMinQuota">
            <el-input-number v-model="form.numberMinQuota" :min="0" placeholder="请输入下限金额" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          ~
        </el-col>
        <el-col :span="4">
          <el-form-item label="金额上限" prop="numberMaxQuota">
            <el-input-number v-model="form.numberMaxQuota" :min="0" placeholder="请输入上限金额" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="小于下限赔率" prop="lessNumberOdd">
            <el-input-number v-model="form.lessNumberOdd" :min="0" :max="100" placeholder="请输入小于下限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="下限上限之间赔率" prop="centerNumberOdd">
            <el-input-number v-model="form.centerNumberOdd" :min="0" :max="100" placeholder="请输入下限上限之间赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="大于上限赔率" prop="greaterNumberOdd">
            <el-input-number v-model="form.greaterNumberOdd" :min="0" :max="100" placeholder="请输入大于上限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <b>------------------------------------------------------------------------------------------------------------------------------------------------</b>
      </el-row>

      <el-row>
        <b>13,14组合特殊赔率：</b>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="金额下限" prop="comboNumberMinQuota">
            <el-input-number v-model="form.comboNumberMinQuota" :min="0" placeholder="请输入下限金额" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          ~
        </el-col>
        <el-col :span="4">
          <el-form-item label="金额上限" prop="comboNumberMaxQuota">
            <el-input-number v-model="form.comboNumberMaxQuota" :min="0" placeholder="请输入上限金额" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="小于下限赔率" prop="comboLessNumberOdd">
            <el-input-number v-model="form.comboLessNumberOdd" :min="0" :max="100" placeholder="请输入小于下限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="下限上限之间赔率" prop="comboCenterNumberOdd">
            <el-input-number v-model="form.comboCenterNumberOdd" :min="0" :max="100" placeholder="请输入下限上限之间赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="大于上限赔率" prop="comboGreaterNumberOdd">
            <el-input-number v-model="form.comboGreaterNumberOdd" :min="0" :max="100" placeholder="请输入大于上限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <b>------------------------------------------------------------------------------------------------------------------------------------------------</b>
      </el-row>

      <el-row>
        <b>顺对豹特殊赔率：</b>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="金额下限" prop="sdbMinQuota">
            <el-input-number v-model="form.sdbMinQuota" :min="0" placeholder="请输入下限金额" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          ~
        </el-col>
        <el-col :span="4">
          <el-form-item label="金额上限" prop="sdbMaxQuota">
            <el-input-number v-model="form.sdbMaxQuota" :min="0" placeholder="请输入上限金额" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="小于下限赔率" prop="lessSdbOdd">
            <el-input-number v-model="form.lessSdbOdd" :min="0" :max="100" placeholder="请输入小于下限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="下限上限之间赔率" prop="centerSdbOdd">
            <el-input-number v-model="form.centerSdbOdd" :min="0" :max="100" placeholder="请输入下限上限之间赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="大于上限赔率" prop="greaterSdbOdd">
            <el-input-number v-model="form.greaterSdbOdd" :min="0" :max="100" placeholder="请输入大于上限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <b>------------------------------------------------------------------------------------------------------------------------------------------------</b>
      </el-row>

      <el-row>
        <b>0,9特殊赔率：</b>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="金额下限" prop="zeroNineMinQuota">
            <el-input-number v-model="form.zeroNineMinQuota" :min="0" placeholder="请输入下限金额" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          ~
        </el-col>
        <el-col :span="4">
          <el-form-item label="金额上限" prop="zeroNineMaxQuota">
            <el-input-number v-model="form.zeroNineMaxQuota" :min="0" placeholder="请输入上限金额" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="4">
          <el-form-item label="小于下限赔率" prop="lessZeroNineOdd">
            <el-input-number v-model="form.lessZeroNineOdd" :min="0" :max="100" placeholder="请输入小于下限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="下限上限之间赔率" prop="centerZeroNineOdd">
            <el-input-number v-model="form.centerZeroNineOdd" :min="0" :max="100" placeholder="请输入下限上限之间赔率" :precision="2"/>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="大于上限赔率" prop="greaterZeroNineOdd">
            <el-input-number v-model="form.greaterZeroNineOdd" :min="0" :max="100" placeholder="请输入大于上限赔率" :precision="2"/>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<script>
import {listOdds, addOdds, updateOdds, getGameOddsInfo} from "@/api/system/odds";
import {getValidGame} from "@/api/system/game";

export default {
  name: "Odds",
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
      // 3球特殊赔率表格数据
      oddsList: [],
      gameListOptions:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        gameId: null,
      },
      formShowFlg:false,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏ID不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    /** 查询3球特殊赔率列表 */
    getList() {
      this.loading = true;
      listOdds(this.queryParams).then(response => {
        this.oddsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getGameOdds(){
      this.reset();
      this.formShowFlg = true;
      getGameOddsInfo(this.queryParams).then(response => {
        if(response.data == undefined){
          this.reset();
        }else{
          this.form = response.data;
        }
        this.form.gameId = this.queryParams.gameId;
        console.log("getGameOdds");
      });
    },
    getGameList(){
      getValidGame({'gameType':'3'}).then(response => {
        this.gameListOptions = response.gameList;
      });
    },
    // 表单重置
    reset() {
      this.form = {
        mixedOddsId: null,
        gameId: null,
        numberMinQuota: 0,
        numberMaxQuota: 0,
        lessNumberOdd: 0,
        centerNumberOdd: 0,
        greaterNumberOdd: 0,
        comboNumberMinQuota: 0,
        comboNumberMaxQuota: 0,
        comboLessNumberOdd: 0,
        comboCenterNumberOdd: 0,
        comboGreaterNumberOdd: 0,
        sdbMinQuota: 0,
        sdbMaxQuota: 0,
        lessSdbOdd: 0,
        centerSdbOdd: 0,
        greaterSdbOdd: 0,
        zeroNineMinQuota: 0,
        zeroNineMaxQuota: 0,
        lessZeroNineOdd: 0,
        centerZeroNineOdd: 0,
        greaterZeroNineOdd: 0,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 提交按钮 */
    submitForm() {
      console.log("submitForm")
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.mixedOddsId != null) {
            updateOdds(this.form).then(response => {
              this.$modal.msgSuccess("特殊赔率设置成功");
            });
          } else {
            addOdds(this.form).then(response => {
              this.$modal.msgSuccess("特殊赔率设置成功");
            });
          }
        }
      });
    },
  }
};
</script>
