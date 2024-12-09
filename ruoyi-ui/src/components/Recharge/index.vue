<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
    <router-link to="/topRecharge/index">
      上分<span class="layui-badge" id="up_count">{{upCount}}</span>
    </router-link>
  </div>
</template>

<script>
import {noApproveRechargeCnt} from "@/api/system/recharge";

export default {
  name: 'TopRecharge',
  props: {
    upCount: {
      type: Number
    }
  },
  // data() {
  //   return {
  //     up_count:0,
  //   }
  // },
  // created() {
  //   this.getUpCount();
  // },
  // mounted() {
  //   setInterval(this.getUpCount, 15000); //每15s刷新列表
  // },
  // methods: {
  //   getUpCount() {
  //     noApproveRechargeCnt().then(response => {
  //       this.up_count = response.upCount;
  //     });
  //   }
  // }
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
