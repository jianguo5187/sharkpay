<template>
  <div class="app-container">
    <el-form ref="logoForm" :model="logo.form" :rules="logo.rules" label-width="120px">
      <el-row>
        <el-col :span="24">
          <el-form-item label="logo图片" prop="logoImg">
            <imageUpload v-model="logo.form.logoImg" :imgUrl="logo.form.logoImg" :limit="1"></imageUpload>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="微信客服图片" prop="wechatImg">
            <imageUpload v-model="logo.form.wechatImg" :imgUrl="logo.form.wechatImg" :limit="1"></imageUpload>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <el-button type="primary" size="mini" @click="submitLogoForm">确认更改logo图片</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {getLogoImg, updateLogoImg} from "@/api/system/user";

export default {
  name: "UploadLogoImg",
  data() {
    return {
      // 上传logo参数
      logo: {
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          logoImg: [
            { required: true, message: "logo图片不能为空", trigger: "blur" }
          ],
        }
      },
    };
  },
  created() {
    this.getLogoImg();
  },
  methods: {
    getLogoImg(){
      this.logo.form = {
        logoImg: undefined
      }
      getLogoImg().then(response => {
        this.logo.form.logoImg = response.logoImg;
        console.log("getLogoImg")
      });
    },
    submitLogoForm(){
      this.$refs["logoForm"].validate(valid => {
        if (valid) {
          updateLogoImg(this.logo.form).then(response => {
            this.$modal.msgSuccess("上传成功");
            this.logo.open = false;
          });
        }
      });
    },
  }
};
</script>
