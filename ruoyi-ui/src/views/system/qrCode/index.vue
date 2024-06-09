<template>
  <el-row :gutter="20" class="dynamic-qrCode-container">
    <el-col class="dynamic-operate" :span="8" v-for="(item, index) in entryDoaminList" :key="index">
      <div class="qrCode-title">入口：{{index+1}}</div>
      <vue-qr
        ref="qrCode"
        :text="item.shareUrl"
        :logoSrc="logoSrc"
        :color-dark="randomColor"
        :callback="qrCodeCallback"
        width="250"
        height="250"
      ></vue-qr>
      <div class="qrCode-text">{{item.shareUrl}}</div>
    </el-col>
  </el-row>
</template>

<script>
import {getLogoImg} from "@/api/system/user";

export default {
  name: "qr_code",
  dicts: ['sys_yes_no'],
  data() {
    return {
      baseUrl: process.env.VUE_APP_BASE_API,
      text:'',
      logoSrc:'',
      randomColor: 'black',
      qrCodeUrl: '', // 存放生成的二维码url
      entryDoaminList:[],
    };
  },
  created() {
    this.getLogoImg();
  },
  methods: {
    /** logo */
    getLogoImg() {
      getLogoImg().then(response => {
        this.logoSrc = this.baseUrl + response.logoImg;
        this.entryDoaminList = response.shareUrlList;
        console.log('getLogoImg');
        this.text = response.urlData;
      });
    },
    qrCodeCallback(url){
      this.qrCodeUrl = url
    },
    handleQrCode(type){
      console.log('handleQrCode');

      switch (type){
        case 1:
          this.randomColor = 'black'
          this.logoSrc = ''
          break
        case 2:
          // this.logoSrc = logo
          break
        case 3:
          this.randomColor = this.getColor()
          break
        case 4:
          let name  = new Date().getTime();
          let a = document.createElement("a");
          a.style.display = "none";
          a.download = name;
          a.href = this.qrCodeUrl;
          document.body.appendChild(a);
          a.click();
          a.remove()
          break
      }
    },
    getColor() {
      var str = '#'
      var arr = ['1', '2', '3', '4', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
      for (var i = 0; i < 6; i++) {
        var num = parseInt(Math.random() * 16)
        str += arr[num]
      }
      return str
    }
  }
};
</script>

<style scoped lang="scss">
.showimg{
  width:345px;
  text-align:center;
  display: flex;
}
.showimg img{
  width:100%;
}
.dynamic-qrCode-container{
  text-align: center;
  //display: flex;
  margin:15px;
}
.dynamic-operate{
  border: 1px solid yellow;
}
.qrCode-title{
  padding-top: 10px;
}
.qrCode-text{
  padding-bottom: 10px;
}
</style>
