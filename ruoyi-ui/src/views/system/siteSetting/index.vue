<template>
  <div class="app-container">
    <el-form ref="siteSettingForm" :model="siteSetting.form" :rules="siteSetting.rules" label-width="120px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="站点开关" prop="siteOpenFlg">
            <el-switch v-model="siteSetting.form.siteOpenFlg"></el-switch>
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
        form: {},
        // 表单校验
        rules: {
          siteOpenFlg: [
            { required: true, message: "微信客服图片不能为空", trigger: "blur" }
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
      this.siteSetting.form = {
        siteOpenFlg: false
      }
      getSiteSetting().then(response => {
        this.siteSetting.form.siteOpenFlg = Boolean(response.siteOpenFlg);
        console.log("getSiteSetting");
      });
    },
    submitForm(){
      this.$refs["siteSettingForm"].validate(valid => {
        if (valid) {
          updateSiteSetting(this.siteSetting.form).then(response => {
            this.$modal.msgSuccess("上传成功");
          });
        }
      });
    },
  }
};
</script>
