<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
    <a @click="gotoChat">
      客服系统
    </a>
  </div>
</template>

<script>
import {selectImChatUrl} from "@/api/system/home";

export default {
  name: 'ImChat',
  data() {
    return {
      url: '',
    }
  },
  created() {
    this.getChatImUrl();
  },
  methods: {
    gotoChat() {
      window.open(this.url)
    },
    getChatImUrl() {
      selectImChatUrl().then(response => {
        this.url = response.imUrl;
      });
    }
  }
}
</script>
<style scoped lang="scss">
.layui-badge,.layui-badge-dot,.layui-badge-rim {
  position: relative;
  display: inline-block;
  padding: 0 6px;
  font-size: 12px;
  text-align: center;
  background-color: #FF5722;
  color: #fff;
  border-radius: 2px
}

.layui-badge {
  height: 18px;
  line-height: 18px
}
</style>
