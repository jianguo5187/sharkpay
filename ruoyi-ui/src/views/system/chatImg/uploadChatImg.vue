<template>
  <div class="app-container">
    <el-form ref="chatForm" :model="chat.form" :rules="chat.rules" label-width="120px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="微信客服图片" prop="wechatImg">
            <imageUpload v-model="chat.form.wechatImg" :imgUrl="chat.form.wechatImg" :limit="1"></imageUpload>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="QQ客服图片" prop="qqChatImg">
            <imageUpload v-model="chat.form.qqChatImg" :imgUrl="chat.form.qqChatImg" :limit="1"></imageUpload>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <el-button type="primary" size="mini" @click="submitchatForm">确认修改</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {getChatImg, updateChatImg} from "@/api/system/user";

export default {
  name: "UploadChatImg",
  data() {
    return {
      // 上传chat参数
      chat: {
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          wechatImg: [
            { required: true, message: "微信客服图片不能为空", trigger: "blur" }
          ],
          qqChatImg: [
            { required: true, message: "QQ客服图片不能为空", trigger: "blur" }
          ],
        }
      },
    };
  },
  created() {
    this.getChatImg();
  },
  methods: {
    getChatImg(){
      this.chat.form = {
        wechatImg: undefined,
        qqChatImg: undefined
      }
      getChatImg().then(response => {
        this.chat.form.wechatImg = response.wechatImg;
        this.chat.form.qqChatImg = response.qqChatImg;
      });
    },
    submitchatForm(){
      this.$refs["chatForm"].validate(valid => {
        if (valid) {
          updateChatImg(this.chat.form).then(response => {
            this.$modal.msgSuccess("上传成功");
          });
        }
      });
    },
  }
};
</script>
