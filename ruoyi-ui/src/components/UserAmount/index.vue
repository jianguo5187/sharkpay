<template>
  <div style="background-color: #DDEBF7;margin: 6px 10px;height: 80%">
      {{userAmount}}
  </div>
</template>

<script>
import {selectUserTotalAmount} from "@/api/system/home";

export default {
  name: 'UserAmount',
  data() {
    return {
      userAmount:0,
    }
  },
  created() {
    this.getUserAmount();
  },
  mounted() {
    setInterval(this.getUserAmount,10000); //每10s刷新列表
  },
  methods: {
    getUserAmount() {
      selectUserTotalAmount().then(response => {
        this.userAmount = response.userTotalAmount;
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
