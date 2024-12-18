<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
<!--    <router-link to="/onlineUser/index">-->
<!--      在线人数<span class="layui-badge" id="online_user_count">{{online_user_count}}</span>-->
<!--    </router-link>-->
    <div @click="gotoOnlineUser">
      在线人数<span class="layui-badge" id="online_user_count">{{online_user_count}}</span>
    </div>
  </div>
</template>

<script>
import {onlineUserCount} from "@/api/monitor/online";

export default {
  name: 'OnlineUser',
  data() {
    return {
      online_user_count:0,
    }
  },
  created() {
    this.getOnlineUserCount();
  },
  mounted() {
    setInterval(this.getOnlineUserCount, 15000); //每15s刷新列表
  },
  methods: {
    getOnlineUserCount() {
      onlineUserCount().then(response => {
        this.online_user_count = response.onlineUserCount;
      });
    },
    gotoOnlineUser(){
      this.$router.push({ path: "/system/online" });
    }
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
