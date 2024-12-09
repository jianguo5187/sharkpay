<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
    <router-link to="/topPostal/index">
      下分<span class="layui-badge" id="up_count">{{downCount}}</span>
    </router-link>
  </div>
</template>

<script>
import {noApproveRechargeAndPostalCnt} from "@/api/system/recharge";
import {noApprovePostalCnt} from "@/api/system/postal";

export default {
  name: 'TopRecharge',
  props: {
    downCount: {
      type: Number
    }
  },
  // data() {
  //   return {
  //     down_count:0,
  //   }
  // },
  // created() {
  //   this.getCount();
  // },
  // mounted() {
  //   setInterval(this.getUpCount, 15000); //每15s刷新列表
  // },
  // methods: {
  //   getUpCount() {
  //     noApprovePostalCnt().then(response => {
  //       this.down_count = response.downCount;
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
