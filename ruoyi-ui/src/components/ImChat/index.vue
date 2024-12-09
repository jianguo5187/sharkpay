<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
    <a @click="gotoChat">
      客服系统<span class="layui-badge" id="no_read_count" v-show="no_read_count > 0">{{no_read_count}}</span>
    </a>
  </div>
</template>

<script>
import {getKefuNoReadCnt, selectImChatUrl} from "@/api/system/home";

export default {
  name: 'ImChat',
  data() {
    return {
      url: '',
      no_read_count:0,
    }
  },
  created() {
    this.getChatImUrl();
    this.getKefuNoReadCnt();
  },
  mounted() {
    setInterval(this.getKefuNoReadCnt,10000); //每10s刷新列表
  },
  methods: {
    gotoChat() {
      window.open(this.url+"?autoKefuImLogin=1");
      localStorage.setItem('autoKefuImLogin','1');
    },
    getChatImUrl() {
      selectImChatUrl().then(response => {
        this.url = response.imUrl;
      });
    },
    getKefuNoReadCnt() {
      getKefuNoReadCnt({"kefuUserId":1}).then(response => {
        this.no_read_count = response.data;
      });
    },
  }
}
</script>
<style scoped lang="scss">
.layui-badge,.layui-badge-dot,.layui-badge-rim {
  position: relative;
  display: inline-block;
  padding: 0 6px;
  font-size: 11px;
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
