<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-form-item label="用户ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable :style="{width: '100%'}" @keyup.enter.native="handleQuery">
        </el-input>
      </el-form-item>
      <el-form-item label="用户昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户昵称"
          clearable
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="用户" prop="userId">-->
<!--        <treeselect-->
<!--          v-model="queryParams.userId"-->
<!--          :options="userListOptions"-->
<!--          :normalizer="normalizer"-->
<!--          :show-count="true"-->
<!--          placeholder="请选择用户"-->
<!--          style="width: 320px;"/>-->
<!--      </el-form-item>-->
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
          @change="handleQuery"
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

    <el-table id="postalList" v-loading="loading" :data="postalList" show-summary :summary-method="getSummaries" @sort-change='sortTableFun' :row-class-name="tableRowClassName">
      <el-table-column label="订单编号" align="center" prop="id" sortable="custom"/>
      <el-table-column label="用户ID" align="center" key="userId" prop="userId" sortable="custom"/>
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}<span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span></span>
        </template>
      </el-table-column>
      <el-table-column label="提现金额" align="center" prop="cashMoney" sortable="custom">
        <template slot-scope="scope">
          -{{scope.row.cashMoney}}
        </template>
      </el-table-column>
      <el-table-column label="余额" align="center" prop="userBalance" sortable="custom"/>
      <el-table-column label="申请时间" align="center" prop="cashTime" sortable="custom" width="135px"/>
<!--      <el-table-column label="方式" align="center" prop="userAccount" />-->
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="备注" align="center" prop="updateBy">
        <template slot-scope="scope">
          <span v-if="scope.row.type == '5' ">
            提现成功(操作者：{{scope.row.updateBy}})
          </span>
          <span v-if="scope.row.type == '6' ">提现失败(操作者：{{scope.row.updateBy}})</span>
        </template>
      </el-table-column>
      <el-table-column label="投注记录" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            title="投注记录"
            size="mini"
            type="danger"
            icon="el-icon-burger"
            @click="showUserBetDetailList(scope.row)"
          >投注记录</el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作时间" align="center" prop="updateTime" width="135"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <span v-if="scope.row.type == '5'">
<!--            提现成功(操作者：{{scope.row.updateBy}})-->
              <el-button
                title="修改金额"
                circle
                size="small"
                icon="el-icon-postcard"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                @click="handleUpdateUserAmount(scope.row)"
              ></el-button>
          </span>
<!--          <span v-if="scope.row.type == '6'">提现失败(操作者：{{scope.row.updateBy}})</span>-->
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

    <el-dialog :title="userBet.title" :visible.sync="userBet.open" width="1400px" append-to-body>
      <bet-real-time :user="userBet.user"/>
    </el-dialog>

    <!-- 修改金额 -->
    <el-dialog :title="updateAmount.title" :visible.sync="updateAmount.open" width="500px" append-to-body>
      <el-form ref="updateUserAmountForm" :model="updateAmount.form" :rules="updateAmount.rules" label-width="120px">
        <el-form-item label="上下分" prop="cashMoney">
          <el-input
            v-model="updateAmount.form.cashMoney"
            placeholder="请输入上下分"
            clearable
          />
          <span>正数为上分,负数为下分</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitUserAmountForm">确 定</el-button>
        <el-button @click="updateAmount.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {agreeApply, refuseApply, listPostal, adminPostal} from "@/api/system/postal";
import {selectAllUser} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import BetRealTime from "@/views/system/bet/betRealTime"
import {adminRecharge} from "@/api/system/recharge";

export default {
  name: "postal",
  components: {BetRealTime, Treeselect},
  dicts: ['sys_postal_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
      // 登录用户Name
      loginUserName: this.$store.state.user.name,
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
      userListOptions:[],
      userBet: {
        // 遮罩层
        loading: true,
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        user: {
          userId: undefined
        },
      },
      // 修改金额
      updateAmount: {
        // 是否显示弹出层（修改金额）
        open: false,
        // 弹出层标题（修改金额）
        title: "",
        // 表单验证（修改金额）
        rules: {
          cashMoney: [
            { required: true, message: "金额必须输入！", trigger: "blur" },
          ],
        },
        // 表单参数（合并用户）
        form: {
          userId: undefined,
          cashMoney: undefined,
        },
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userId: undefined,
        nickName: undefined,
        postalStatus: null,
        filterDate: null,
        orderByColumn:"cashTime desc ,id",
        isAsc:"desc",
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
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
    // getUserList(){
    //   selectAllUser().then(response => {
    //     this.userListOptions = [];
    //     const menu = { userId: this.loginUserId, nickName: this.loginUserName, children: [] };
    //     menu.children = this.handleTree(response.rows, "userId", "parentUserId");
    //     this.userListOptions.push(menu);
    //     this.getList();
    //   });
    // },
    // /** 转换菜单数据结构 */
    // normalizer(node) {
    //   if (node.children && !node.children.length) {
    //     delete node.children;
    //   }
    //   return {
    //     id: node.userId,
    //     label: node.nickName,
    //     children: node.children
    //   };
    // },
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
    sortTableFun(data) {
      const { prop, order } = data
      //排序列
      this.queryParams.orderByColumn=prop;
      //排序顺序ascending或descending
      this.queryParams.isAsc=order;
      //返回第一页
      this.queryParams.pageNum=1;
      this.getList();
    },
    showUserBetDetailList(row){
      this.userBet.open = true;
      this.userBet.title = "投注记录";
      this.userBet.user = {};
      this.userBet.user.userId = row.userId;
    },
    dateFormat(row, column, cellValue) {
      const date = cellValue;
      if (date) {
        return this.formatDateToString(new Date(date));
      } else {
        return '--';
      }
    },
    formatDateToString(date) {
      console.log("formatDateToString");
      // return '--';
      const year = date.getFullYear();
      const month = this.padStart(date.getMonth() + 1);
      const day = this.padStart(date.getDate());
      return `${year}-${month}-${day}`;
    },
    padStart(value) {
      return value.toString().padStart(2, '0');
    },
    /** 修改金额按钮操作 */
    handleUpdateUserAmount(row) {
      this.updateAmount.form = {
        userId: undefined,
        amount: undefined,
      };
      this.updateAmount.title = "修改金额";
      this.updateAmount.open = true;
      this.updateAmount.form.userId = row.userId;
    },
    submitUserAmountForm(){
      var updateUserAmountForm = this.updateAmount;
      this.$refs["updateUserAmountForm"].validate(valid => {
        if (valid) {
          if(updateUserAmountForm.form.cashMoney > 0 ){
            console.log('submitUserAmountForm1');
            adminRecharge(updateUserAmountForm.form).then(response => {
              updateUserAmountForm.open = false;
              this.getList();
              this.$modal.msgSuccess("上分成功");
            });
          }else if(updateUserAmountForm.form.cashMoney <0){
            updateUserAmountForm.form.cashMoney = updateUserAmountForm.form.cashMoney * -1;
            adminPostal(updateUserAmountForm.form).then(response => {
              updateUserAmountForm.open = false;
              this.getList();
              this.$modal.msgSuccess("下分成功");
            });
          }
        }
      });
    },
    tableRowClassName({row, rowIndex}) {
      if (row.type == '5') {
        return 'success-row';
      } else if(row.type == '6') {
        return 'warning-row';
      }
      return ''
    },
  }
};
</script>


<style>
.warning-row{
  background: #f4d8d4 !important;
}
.success-row{
  background: #e0f5e9 !important;
}
#postalList .el-table__cell{
  padding: 2px 0px;
}
</style>
