<template>
  <div class="app-container">
    <el-form ref="gameLimitSettingForm" :model="gameLimitSetting.form" :rules="gameLimitSetting.rules" label-width="280px">
      <el-row>
        <b>3球投注限制：</b>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="特殊号码限额" prop="threeBallBetSpecialAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetSpecialAmount" :min="0" placeholder="请输入特殊号码限额"/> 0不限制投注个数(特殊号码：0,1,2,3,24,25,26,27)
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="号码投注个数" prop="threeBallBetNumCount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetNumCount" :min="0" placeholder="请输入号码投注个数"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="最小投注额度" prop="threeBallMinBetAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallMinBetAmount" :min="0" placeholder="请输入最小投注额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注总额度" prop="threeBallMaxSumBetAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallMaxSumBetAmount" :min="0" placeholder="请输入投注总额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注数字限额" prop="threeBallBetNumAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetNumAmount" :min="0" placeholder="请输入投注数字限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注大小单双限额" prop="threeBallBetDxdsAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetDxdsAmount" :min="0" placeholder="请输入投注大小单双限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注极值限额" prop="threeBallBetMuchAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetMuchAmount" :min="0" placeholder="请输入投注极值限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注组合限额" prop="threeBallBetCombinationAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetCombinationAmount" :min="0" placeholder="请输入投注组合限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注波色限额" prop="threeBallBetBoseAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetBoseAmount" :min="0" placeholder="请输入投注波色限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注对顺豹限额" prop="threeBallBetSdbAmount">
            <el-input-number v-model="gameLimitSetting.form.threeBallBetSdbAmount" :min="0" placeholder="请输入投注对顺豹限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <b>------------------------------------------------------------------------------------------------------------------------------------------------</b>
      </el-row>

      <el-row>
        <b>5球投注限制：</b>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="最小投注额度" prop="fiveBallMinBetAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallMinBetAmount" :min="0" placeholder="请输入最小投注额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注总额度" prop="fiveBallMaxSumBetAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallMaxSumBetAmount" :min="0" placeholder="请输入投注总额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注和值（和）限额" prop="fiveBallBetHeAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallBetHeAmount" :min="0" placeholder="请输入投注和值（和）限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注大小单双龙虎限额" prop="fiveBallBetDxdslhAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallBetDxdslhAmount" :min="0" placeholder="请输入投注大小单双龙虎限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注数字号码限额" prop="fiveBallBetNumAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallBetNumAmount" :min="0" placeholder="请输入投注前中后限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注前中后三投限额" prop="fiveBallBetQzhAmount">
            <el-input-number v-model="gameLimitSetting.form.fiveBallBetQzhAmount" :min="0" placeholder="请输入投注前中后三投限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <b>------------------------------------------------------------------------------------------------------------------------------------------------</b>
      </el-row>

      <el-row>
        <b>10球投注限制：</b>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="最小投注额度" prop="tenBallMinBetAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallMinBetAmount" :min="0" placeholder="请输入最小投注额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注总额度" prop="tenBallMaxSumBetAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallMaxSumBetAmount" :min="0" placeholder="请输入投注总额度"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注冠亚和特殊号码总额度" prop="tenBallBetSpecialNumAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallBetSpecialNumAmount" :min="0" placeholder="请输入投注冠亚和特殊号码总额度"/> 0不限制投注个数(特殊号码：3,4,18,19)
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注冠亚和其他号码总额度" prop="tenBallBetOtherNumAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallBetOtherNumAmount" :min="0" placeholder="请输入投注冠亚和其他号码总额度"/> 0不限制投注个数(其他号码：除特殊号码外的数字)
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注大小单双龙虎限额" prop="tenBallBetDxdslhAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallBetDxdslhAmount" :min="0" placeholder="请输入投注大小单双龙虎限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="投注赛道号码限额" prop="tenBallBetNumAmount">
            <el-input-number v-model="gameLimitSetting.form.tenBallBetNumAmount" :min="0" placeholder="请输入投注赛道号码限额"/> 0不限制投注个数
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <el-button type="primary" size="mini" @click="submitForm">确认修改</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {getGameLimitSetting, updateGameLimitSetting} from "@/api/system/game";

export default {
  name: "gameLimitSetting",
  data() {
    return {
      // 上传chat参数
      gameLimitSetting: {
        // 表单参数
        form: {
          threeBallBetSpecialAmount: undefined,
          threeBallBetNumCount: undefined,
          threeBallMinBetAmount: undefined,
          threeBallMaxSumBetAmount: undefined,
          threeBallBetNumAmount: undefined,
          threeBallBetDxdsAmount: undefined,
          threeBallBetMuchAmount: undefined,
          threeBallBetCombinationAmount: undefined,
          threeBallBetBoseAmount: undefined,
          threeBallBetSdbAmount: undefined,
          fiveBallMinBetAmount: undefined,
          fiveBallMaxSumBetAmount: undefined,
          fiveBallBetHeAmount: undefined,
          fiveBallBetDxdslhAmount: undefined,
          fiveBallBetNumAmount: undefined,
          fiveBallBetQzhAmount: undefined,
          tenBallMinBetAmount: undefined,
          tenBallMaxSumBetAmount: undefined,
          tenBallBetSpecialNumAmount: undefined,
          tenBallBetOtherNumAmount: undefined,
          tenBallBetDxdslhAmount: undefined,
          tenBallBetNumAmount: undefined,
        },
        // 表单校验
        rules: {
          threeBallBetSpecialAmount: [
            { required: true, message: "3球特殊号码限额不能为空", trigger: "blur" }
          ],
          threeBallBetNumCount: [
            { required: true, message: "3球号码投注个数不能为空", trigger: "blur" }
          ],
          threeBallMinBetAmount: [
            { required: true, message: "3球最小投注额度不能为空", trigger: "blur" }
          ],
          threeBallMaxSumBetAmount: [
            { required: true, message: "3球投注总额度不能为空", trigger: "blur" }
          ],
          threeBallBetNumAmount: [
            { required: true, message: "3球投注数字限额不能为空", trigger: "blur" }
          ],
          threeBallBetDxdsAmount: [
            { required: true, message: "3球投注大小单双限额不能为空", trigger: "blur" }
          ],
          threeBallBetMuchAmount: [
            { required: true, message: "3球投注极值限额不能为空", trigger: "blur" }
          ],
          threeBallBetCombinationAmount: [
            { required: true, message: "3球投注组合限额不能为空", trigger: "blur" }
          ],
          threeBallBetBoseAmount: [
            { required: true, message: "3球投注波色限额不能为空", trigger: "blur" }
          ],
          threeBallBetSdbAmount: [
            { required: true, message: "3球投注对顺豹限额不能为空", trigger: "blur" }
          ],
          fiveBallMinBetAmount: [
            { required: true, message: "5球最小投注额度不能为空", trigger: "blur" }
          ],
          fiveBallMaxSumBetAmount: [
            { required: true, message: "5球投注总额度不能为空", trigger: "blur" }
          ],
          fiveBallBetHeAmount: [
            { required: true, message: "5球投注和值（和）限额不能为空", trigger: "blur" }
          ],
          fiveBallBetDxdslhAmount: [
            { required: true, message: "5球投注大小单双龙虎限额不能为空", trigger: "blur" }
          ],
          fiveBallBetNumAmount: [
            { required: true, message: "5球投注数字号码限额不能为空", trigger: "blur" }
          ],
          fiveBallBetQzhAmount: [
            { required: true, message: "5球投注前中后三投限额不能为空", trigger: "blur" }
          ],
          tenBallMinBetAmount: [
            { required: true, message: "10球最小投注额度不能为空", trigger: "blur" }
          ],
          tenBallMaxSumBetAmount: [
            { required: true, message: "10球投注总额度不能为空", trigger: "blur" }
          ],
          tenBallBetSpecialNumAmount: [
            { required: true, message: "10球投注冠亚和特殊号码总额度不能为空", trigger: "blur" }
          ],
          tenBallBetOtherNumAmount: [
            { required: true, message: "10球投注冠亚和其他号码总额度不能为空", trigger: "blur" }
          ],
          tenBallBetDxdslhAmount: [
            { required: true, message: "10球投注大小单双龙虎限额不能为空", trigger: "blur" }
          ],
          tenBallBetNumAmount: [
            { required: true, message: "10球投注赛道号码限额不能为空", trigger: "blur" }
          ],
        }
      },
    };
  },
  created() {
    this.getgameLimitSetting();
  },
  methods: {
    getgameLimitSetting(){
      this.resetForm();
      // this.gameLimitSetting.form = {
      //   siteOpenFlg: false
      // }
      getGameLimitSetting().then(response => {
        if(response.gameLimitSetting.threeBallBetSpecialAmount != undefined){
          this.gameLimitSetting.form.threeBallBetSpecialAmount = response.gameLimitSetting.threeBallBetSpecialAmount;
        }
        if(response.gameLimitSetting.threeBallBetNumCount != undefined){
          this.gameLimitSetting.form.threeBallBetNumCount = response.gameLimitSetting.threeBallBetNumCount;
        }
        if(response.gameLimitSetting.threeBallMinBetAmount != undefined){
          this.gameLimitSetting.form.threeBallMinBetAmount = response.gameLimitSetting.threeBallMinBetAmount;
        }
        if(response.gameLimitSetting.threeBallMaxSumBetAmount != undefined){
          this.gameLimitSetting.form.threeBallMaxSumBetAmount = response.gameLimitSetting.threeBallMaxSumBetAmount;
        }
        if(response.gameLimitSetting.threeBallBetNumAmount != undefined){
          this.gameLimitSetting.form.threeBallBetNumAmount = response.gameLimitSetting.threeBallBetNumAmount;
        }
        if(response.gameLimitSetting.threeBallMaxSumBetAmount != undefined){
          this.gameLimitSetting.form.threeBallBetDxdsAmount = response.gameLimitSetting.threeBallBetDxdsAmount;
        }
        if(response.gameLimitSetting.threeBallBetMuchAmount != undefined){
          this.gameLimitSetting.form.threeBallBetMuchAmount = response.gameLimitSetting.threeBallBetMuchAmount;
        }
        if(response.gameLimitSetting.threeBallBetCombinationAmount != undefined){
          this.gameLimitSetting.form.threeBallBetCombinationAmount = response.gameLimitSetting.threeBallBetCombinationAmount;
        }
        if(response.gameLimitSetting.threeBallBetBoseAmount != undefined){
          this.gameLimitSetting.form.threeBallBetBoseAmount = response.gameLimitSetting.threeBallBetBoseAmount;
        }
        if(response.gameLimitSetting.threeBallBetSdbAmount != undefined){
          this.gameLimitSetting.form.threeBallBetSdbAmount = response.gameLimitSetting.threeBallBetSdbAmount;
        }
        if(response.gameLimitSetting.fiveBallMinBetAmount != undefined){
          this.gameLimitSetting.form.fiveBallMinBetAmount = response.gameLimitSetting.fiveBallMinBetAmount;
        }
        if(response.gameLimitSetting.fiveBallMaxSumBetAmount != undefined){
          this.gameLimitSetting.form.fiveBallMaxSumBetAmount = response.gameLimitSetting.fiveBallMaxSumBetAmount;
        }
        if(response.gameLimitSetting.fiveBallBetHeAmount != undefined){
          this.gameLimitSetting.form.fiveBallBetHeAmount = response.gameLimitSetting.fiveBallBetHeAmount;
        }
        if(response.gameLimitSetting.fiveBallBetDxdslhAmount != undefined){
          this.gameLimitSetting.form.fiveBallBetDxdslhAmount = response.gameLimitSetting.fiveBallBetDxdslhAmount;
        }
        if(response.gameLimitSetting.fiveBallBetNumAmount != undefined){
          this.gameLimitSetting.form.fiveBallBetNumAmount = response.gameLimitSetting.fiveBallBetNumAmount;
        }
        if(response.gameLimitSetting.fiveBallBetQzhAmount != undefined){
          this.gameLimitSetting.form.fiveBallBetQzhAmount = response.gameLimitSetting.fiveBallBetQzhAmount;
        }
        if(response.gameLimitSetting.tenBallMinBetAmount != undefined){
          this.gameLimitSetting.form.tenBallMinBetAmount = response.gameLimitSetting.tenBallMinBetAmount;
        }
        if(response.gameLimitSetting.tenBallMaxSumBetAmount != undefined){
          this.gameLimitSetting.form.tenBallMaxSumBetAmount = response.gameLimitSetting.tenBallMaxSumBetAmount;
        }
        if(response.gameLimitSetting.tenBallBetSpecialNumAmount != undefined){
          this.gameLimitSetting.form.tenBallBetSpecialNumAmount = response.gameLimitSetting.tenBallBetSpecialNumAmount;
        }
        if(response.gameLimitSetting.tenBallBetOtherNumAmount != undefined){
          this.gameLimitSetting.form.tenBallBetOtherNumAmount = response.gameLimitSetting.tenBallBetOtherNumAmount;
        }
        if(response.gameLimitSetting.tenBallBetDxdslhAmount != undefined){
          this.gameLimitSetting.form.tenBallBetDxdslhAmount = response.gameLimitSetting.tenBallBetDxdslhAmount;
        }
        if(response.gameLimitSetting.tenBallBetNumAmount != undefined){
          this.gameLimitSetting.form.tenBallBetNumAmount = response.gameLimitSetting.tenBallBetNumAmount;
        }

        console.log("getgameLimitSetting");
      });
    },
    submitForm(){
      this.$refs["gameLimitSettingForm"].validate(valid => {
        if (valid) {
          updateGameLimitSetting(this.gameLimitSetting.form).then(response => {
            this.$modal.msgSuccess("更新成功");
          });
        }
      });
    },
    resetForm(){
      this.gameLimitSetting.form = {
        threeBallBetSpecialAmount: undefined,
        threeBallBetNumCount: undefined,
        threeBallMinBetAmount: undefined,
        threeBallMaxSumBetAmount: undefined,
        threeBallBetNumAmount: undefined,
        threeBallBetDxdsAmount: undefined,
        threeBallBetMuchAmount: undefined,
        threeBallBetCombinationAmount: undefined,
        threeBallBetBoseAmount: undefined,
        threeBallBetSdbAmount: undefined,
        fiveBallMinBetAmount: undefined,
        fiveBallMaxSumBetAmount: undefined,
        fiveBallBetHeAmount: undefined,
        fiveBallBetDxdslhAmount: undefined,
        fiveBallBetNumAmount: undefined,
        fiveBallBetQzhAmount: undefined,
        tenBallMinBetAmount: undefined,
        tenBallMaxSumBetAmount: undefined,
        tenBallBetSpecialNumAmount: undefined,
        tenBallBetOtherNumAmount: undefined,
        tenBallBetDxdslhAmount: undefined,
        tenBallBetNumAmount: undefined,
      }
    }
  }
};
</script>
