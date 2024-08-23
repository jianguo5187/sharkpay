<template>
  <div class="app-container">
    <el-form ref="siteSettingForm" :model="siteSetting.form" :rules="siteSetting.rules" label-width="140px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="站点开关" prop="siteOpenFlg">
            <el-switch v-model="siteSetting.form.siteOpenFlg"></el-switch>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="最小充值金额" prop="minChargeMoney">
            <el-input-number v-model="siteSetting.form.minChargeMoney" :min="10" placeholder="请输入最小充值金额"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="最小提现金额" prop="minPostalMoney">
            <el-input-number v-model="siteSetting.form.minPostalMoney" :min="10" placeholder="请输入最小提现金额"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="每日提现次数" prop="postalMaxCnt">
            <el-input-number v-model="siteSetting.form.postalMaxCnt" :min="1" placeholder="请输入每日提现次数"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="app首页公告内容" prop="appHomeNotice">
            <el-input v-model="siteSetting.form.appHomeNotice" placeholder="请输入app首页公告内容"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="官方开奖URL" prop="openRecordUrl">
            <el-input v-model="siteSetting.form.openRecordUrl" placeholder="请输入官方开奖URL"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="网站唯一标识ID" prop="webType">
            <el-input v-model="siteSetting.form.webType" placeholder="请输入网站唯一标识ID"/> 二维码网站跳转唯一识别key
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="网站名称" prop="webName">
            <el-input v-model="siteSetting.form.webName" placeholder="请输入网站名称"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="微信appId" prop="wechatAppId">
            <el-input v-model="siteSetting.form.wechatAppId" placeholder="请输入微信appId"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="微信appSecret" prop="wechatAppSecret">
            <el-input v-model="siteSetting.form.wechatAppSecret" placeholder="请输入微信appSecret"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="授权域名" prop="wechatAuthUrl">
            <el-input v-model="siteSetting.form.wechatAuthUrl" placeholder="请输入授权域名"/> 例如：http://c12q.zs2ux.cn
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="客服端聊天地址" prop="kefuImUrl">
            <el-input v-model="siteSetting.form.kefuImUrl" placeholder="请输入客服端聊天地址"/> 例如：http://43.132.168.72:81
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="玩家端聊天地址" prop="appImUrl">
            <el-input v-model="siteSetting.form.appImUrl" placeholder="请输入玩家端聊天地址"/> 例如：http://43.132.168.72:82
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="二维码服务器IP地址" prop="qrServerUrl">
            <el-input v-model="siteSetting.form.qrServerUrl" placeholder="请输入二维码服务器IP地址"/> 例如：http://43.159.192.159
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="自开彩种赢亏比率" prop="systemGameWinRate">
            <el-input-number v-model="siteSetting.form.systemGameWinRate" :min="1" :max="100" placeholder="请输入自开彩种赢亏比率"/> 1~100
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
import {getSiteSetting, updateSiteSetting} from "@/api/system/user";

export default {
  name: "SiteSetting",
  data() {
    return {
      // 上传chat参数
      siteSetting: {
        // 表单参数
        form: {
          siteOpenFlg: false,
          minChargeMoney: 10,
          minPostalMoney: 10,
          postalMaxCnt: 1,
          // imSite: undefined,
          // appImSite: undefined,
          appHomeNotice: undefined,
          openRecordUrl: undefined,
          webType: undefined,
          webName: undefined,
          wechatAppId: undefined,
          wechatAppSecret: undefined,
          wechatAuthUrl: undefined,
          kefuImUrl: undefined,
          appImUrl: undefined,
          qrServerUrl: undefined,
          systemGameWinRate: 10,
        },
        // 表单校验
        rules: {
          siteOpenFlg: [
            { required: true, message: "站点开关不能为空", trigger: "blur" }
          ],
          minChargeMoney: [
            { required: true, message: "最小充值金额不能为空", trigger: "blur" }
          ],
          minPostalMoney: [
            { required: true, message: "最小提现金额不能为空", trigger: "blur" }
          ],
          postalMaxCnt: [
            { required: true, message: "每日提现次数不能为空", trigger: "blur" }
          ],
          appHomeNotice: [
            { required: true, message: "app首页公告内容不能为空", trigger: "blur" }
          ],
          openRecordUrl: [
            { required: true, message: "官方开奖URL不能为空", trigger: "blur" }
          ],
          webType: [
            { required: true, message: "网站唯一标识ID不能为空", trigger: "blur" }
          ],
          webName: [
            { required: true, message: "网站名称不能为空", trigger: "blur" }
          ],
          wechatAppId: [
            { required: true, message: "微信appId不能为空", trigger: "blur" }
          ],
          wechatAppSecret: [
            { required: true, message: "微信Secret不能为空", trigger: "blur" }
          ],
          wechatAuthUrl: [
            { required: true, message: "授权域名不能为空", trigger: "blur" }
          ],
          kefuImUrl: [
            { required: true, message: "客服聊天网站地址不能为空", trigger: "blur" }
          ],
          appImUrl: [
            { required: true, message: "客户聊天网站地不能为空", trigger: "blur" }
          ],
          qrServerUrl: [
            { required: true, message: "二维码服务器IP地址不能为空", trigger: "blur" }
          ],
          systemGameWinRate: [
            { required: true, message: "自开彩种赢亏比率不能为空", trigger: "blur" }
          ],
        }
      },
    };
  },
  created() {
    this.getSiteSetting();
  },
  methods: {
    getSiteSetting(){
      // this.siteSetting.form = {
      //   siteOpenFlg: false
      // }
      getSiteSetting().then(response => {
        this.siteSetting.form.siteOpenFlg = Boolean(response.siteOpenFlg);

        if(response.minChargeMoney != undefined){
          this.siteSetting.form.minChargeMoney = response.minChargeMoney;
        }
        if(response.minPostalMoney != undefined){
          this.siteSetting.form.minPostalMoney = response.minPostalMoney;
        }
        if(response.postalMaxCnt != undefined){
          this.siteSetting.form.postalMaxCnt = response.postalMaxCnt;
        }
        if(response.appHomeNotice != undefined){
          this.siteSetting.form.appHomeNotice = response.appHomeNotice;
        }
        if(response.openRecordUrl != undefined){
          this.siteSetting.form.openRecordUrl = response.openRecordUrl;
        }
        if(response.webType != undefined){
          this.siteSetting.form.webType = response.webType;
        }
        if(response.webName != undefined){
          this.siteSetting.form.webName = response.webName;
        }
        if(response.wechatAppId != undefined){
          this.siteSetting.form.wechatAppId = response.wechatAppId;
        }
        if(response.wechatAppSecret != undefined){
          this.siteSetting.form.wechatAppSecret = response.wechatAppSecret;
        }
        if(response.wechatAuthUrl != undefined){
          this.siteSetting.form.wechatAuthUrl = response.wechatAuthUrl;
        }
        if(response.kefuImUrl != undefined){
          this.siteSetting.form.kefuImUrl = response.kefuImUrl;
        }
        if(response.appImUrl != undefined){
          this.siteSetting.form.appImUrl = response.appImUrl;
        }
        if(response.qrServerUrl != undefined){
          this.siteSetting.form.qrServerUrl = response.qrServerUrl;
        }
        if(response.systemGameWinRate != undefined){
          this.siteSetting.form.systemGameWinRate = response.systemGameWinRate;
        }
        console.log("getSiteSetting");
      });
    },
    submitForm(){
      this.$refs["siteSettingForm"].validate(valid => {
        if (valid) {
          updateSiteSetting(this.siteSetting.form).then(response => {
            this.$modal.msgSuccess("更新成功");
          });
        }
      });
    },
  }
};
</script>
