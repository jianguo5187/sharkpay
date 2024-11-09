<template>
  <div class="app-container home">

    <el-row :gutter="10" style="margin-bottom:30px">
      <el-col :span="6">
        <el-card style="color:#409EFF">
          <div><i class="el-icon-user-solid"/>用户数</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{userTotal}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card style="color:#F56C6C">
          <div><i class="el-icon-money"/>投注总额</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{betTotalAmount}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card  style="color:#67C23A">
          <div><i class="el-icon-bank-card"/>盈亏总额</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{betWinTotalAmount}}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card  style="color:#409EFF">
          <div style="color:#409EFF"><i class="el-icon-s-shop"/>今日盈亏</div>
          <div style="padding:10px 0;text-align:center;font-weight:bold">{{todayWinMoney}}</div>
        </el-card>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="11">
        <div id="main" class="echarts-border" style="width:500px; height:400px"></div>
      </el-col>
<!--    </el-row>-->
<!--    <el-row>-->
      <el-col :span="13">
        <div id="betEchart" class="echarts-border" style="width:600px; height:400px"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>

import * as echarts from 'echarts';
import {selectHomePageData} from "@/api/system/home";
export default {
  name: "Index",
  data() {
    return {
      userTotal:0,
      betTotalAmount:0,
      betWinTotalAmount:0,
      todayWinMoney:0,
      upDownMoneyEchartTitle:[],
      upMoneyEchartSeriesData:[],
      downMoneyEchartSeriesData:[],
      gameBetEchartTitle:[],
      gameBetEchartLegend:[],
      gameBetEchartSeries:[],
    };
  },
  methods: {
    initHome(){
      selectHomePageData().then(response => {
        console.log("initHome");
        this.userTotal = response.homePageData.userCnt;
        this.betTotalAmount = response.homePageData.betTotalAmount==null?0:response.homePageData.betTotalAmount;
        this.betWinTotalAmount = response.homePageData.betWinTotalAmount==null?0:response.homePageData.betWinTotalAmount;
        this.todayWinMoney = response.homePageData.todayWinMoney==null?0:response.homePageData.todayWinMoney;
        this.upDownMoneyEchartTitle = response.homePageData.upDownMoneyEchartTitle;
        this.upMoneyEchartSeriesData = response.homePageData.upMoneyEchartSeriesData;
        this.downMoneyEchartSeriesData = response.homePageData.downMoneyEchartSeriesData;
        this.gameBetEchartTitle = response.homePageData.gameBetEchartTitle;
        this.gameBetEchartLegend = response.homePageData.gameBetEchartLegend;
        this.gameBetEchartSeries = response.homePageData.gameBetEchartSeries;
        this.upDownMoneyEchartInit();
        this.gameBetEchartInit();
      });
    },
    upDownMoneyEchartInit() {
      var chartDom = document.getElementById('main');
      var myChart = echarts.init(chartDom);
      var charOption;
      charOption = {
        title: {
          text: '上下分统计',
          // subtext: '趋势图',
          // left: 'center'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ["上分", "下分"]
        },
        xAxis: {
          type: 'category',
          data: this.upDownMoneyEchartTitle,
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: this.upMoneyEchartSeriesData,
            name: '上分',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#26ff00', // 折线点的颜色
                lineStyle: {
                  color: '#26ff00' // 折线的颜色
                }
              }
            },
          },
          {
            data: this.downMoneyEchartSeriesData,
            name: '下分',
            type: 'line',
            itemStyle: {
              normal: {
                color: '#ff0000', // 折线点的颜色
                lineStyle: {
                  color: '#ff0000' // 折线的颜色
                }
              }
            },
          },
        ]
      };
      myChart.setOption(charOption);
    },
    gameBetEchartInit() {
      var chartDom = document.getElementById('betEchart');
      var myChart = echarts.init(chartDom);
      var charOption;
      charOption = {
        title: {
          text: '投注统计',
          top:-3,
        },
        tooltip: {
          trigger: 'axis',
        },
        legend: {
          data: this.gameBetEchartLegend,
          top:"4%",
        },
        xAxis: {
          type: 'category',
          data: this.gameBetEchartTitle,
        },
        yAxis: {
          type: 'value'
        },
        series: this.gameBetEchartSeries
      };
      myChart.setOption(charOption);
    }
  },
  mounted() {
    this.initHome();
  }
};
</script>

<style scoped lang="scss">
.echarts-border{
  border: 2px solid #a7deec; /* 设置边框宽度、样式和颜色 */
  border-radius: 10px; /* 设置圆角的半径大小 */
  padding: 10px; /* 内边距 */
  width: 200px; /* 宽度 */
  margin: 10px; /* 外边距 */
}
</style>

