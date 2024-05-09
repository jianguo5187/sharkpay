<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="用户ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="提现申请时间" prop="filterDate">
        <el-date-picker v-model="queryParams.filterDate" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
                        :style="{width: '100%'}" placeholder="请选择提现申请时间" clearable></el-date-picker>
      </el-form-item>

      <el-form-item label="提现方式" prop="postalStatus">
        <el-select
          v-model="queryParams.postalStatus"
          placeholder="提现方式"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.sys_postal_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postalList" show-summary :summary-method="getSummaries">
      <el-table-column label="订单编号" align="center" prop="id" />
      <el-table-column label="用户名" align="center" prop="userId">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}(<span style="color: red">{{ scope.row.userId }}</span>)</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="提现金额" align="center" prop="cashMoney" />
      <el-table-column label="余额" align="center" prop="userBalance" />
      <el-table-column label="申请时间" align="center" prop="cashTime" />
      <el-table-column label="方式" align="center" prop="userAccount" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.type == '5'">提现成功</span>
          <span v-if="scope.row.type == '6'">提现失败</span>
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
            v-if="scope.row.type == '4'"
            @click="handleAgree(scope.row)"
          >同意</el-button>
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            v-if="scope.row.type == '4'"
            @click="handleCancel(scope.row)"
          >拒绝</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import {agreeApply, refuseApply, listPostal} from "@/api/system/postal";
import {getValidGame} from "@/api/system/game";

export default {
  name: "postal",
  dicts: ['sys_postal_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 投注机器人表格数据
      postalList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: null,
        postalStatus: null,
        filterDate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getGameList();
  },
  mounted() {
    setInterval(this.getList, 15000); //每15s刷新列表
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      if(this.queryParams.settledFlg){
        this.queryParams.settledFlgStr = "0";
      }else{
        this.queryParams.settledFlgStr = null;
      }
      listPostal(this.queryParams).then(response => {
        this.postalList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        this.getList();
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 同意按钮操作 */
    handleAgree(row) {
      this.$modal.confirmWithTilte('是否确定同意申请?','同意后不可恢复').then(function() {
        return agreeApply({id:row.id});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("同意成功");
      }).catch(() => {});
    },
    /** 拒绝按钮操作 */
    handleCancel(row) {
      this.$modal.confirmWithTilte('是否确定拒绝申请?','拒绝后不可恢复').then(function() {
        return refuseApply({id:row.id});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("拒绝成功");
      }).catch(() => {});
    },
    // 合计 指定某一列添加合计
    getSummaries(param) {
      console.log(param, "heji11111");
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = "合计";
          return;
        } else if (column.property == "cashMoney") {
          //如果是经费（正常的加减法）
          const values = data.map((item) => Number(item[column.property]));
          console.log(values);
          if (!values.every((value) => isNaN(value))) {
            sums[index] = values.reduce((prev, curr) => {
              const value = Number(curr);
              var sum = 0;
              if (!isNaN(value)) {
                sum = Number(Number(prev) + Number(curr)).toFixed(2);
                return sum;
              } else {
                return prev;
              }
            }, 0);
            sums[index] += " ";
          }
        }
      });
      return sums;
    },
  }
};
</script>
