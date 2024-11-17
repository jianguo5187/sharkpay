<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="转出用户ID" prop="transferUserId">
        <el-input
          v-model="queryParams.transferUserId"
          placeholder="请输入转出用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
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

      <el-form-item label="审核状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择审核状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_commission_transfer_status"
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
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['system:commissionTransfer:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['system:commissionTransfer:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['system:commissionTransfer:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:commissionTransfer:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="commissionTransferList" :row-class-name="tableRowClassName">
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="转出用户ID" align="center" prop="transferUserId" />
      <el-table-column label="昵称" align="center" prop="nickName">
        <template slot-scope="scope">
          <span>{{ scope.row.nickName }}<span v-if="scope.row.remarkName != null" style="color: red">({{ scope.row.remarkName }})</span></span>
        </template>
      </el-table-column>
      <el-table-column label="转出佣金" align="center" prop="transferAmount" />
<!--      <el-table-column label="审核状态" align="center" prop="status">-->
<!--        <template slot-scope="scope">-->
<!--          <dict-tag :options="dict.type.sys_commission_transfer_status" :value="scope.row.status"/>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="申请时间" align="center" prop="createTime"/>
      <el-table-column label="操作时间" align="center" prop="updateTime"/>
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['system:commissionTransfer:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['system:commissionTransfer:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
        <template slot-scope="scope">
          <span v-if="scope.row.status == '1'">
            提现成功(操作者：{{scope.row.updateBy}})
          </span>
          <span v-if="scope.row.status == '2'">提现失败(操作者：{{scope.row.updateBy}})</span>
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
            v-if="scope.row.status == '0'"
            @click="handleAgree(scope.row)"
          >同意</el-button>
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            v-if="scope.row.status == '0'"
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

    <!-- 添加或修改佣金转出审核对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="佣金转出审核ID" prop="userCommissionId">
          <el-input v-model="form.userCommissionId" placeholder="请输入佣金转出审核ID" />
        </el-form-item>
        <el-form-item label="转出用户ID" prop="transferUserId">
          <el-input v-model="form.transferUserId" placeholder="请输入转出用户ID" />
        </el-form-item>
        <el-form-item label="转出佣金" prop="transferAmount">
          <el-input v-model="form.transferAmount" placeholder="请输入转出佣金" />
        </el-form-item>
        <el-form-item label="审核状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择审核状态">
            <el-option
              v-for="dict in dict.type.sys_commission_transfer_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listCommissionTransfer,
  getCommissionTransfer,
  delCommissionTransfer,
  addCommissionTransfer,
  updateCommissionTransfer,
  agreeTransferApply, refuseTransferApply
} from "@/api/system/commissionTransfer";

export default {
  name: "CommissionTransfer",
  dicts: ['sys_commission_transfer_status'],
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
      // 佣金转出审核表格数据
      commissionTransferList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userCommissionId: null,
        transferUserId: null,
        transferAmount: null,
        status: null,
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
  methods: {
    /** 查询佣金转出审核列表 */
    getList() {
      this.loading = true;
      listCommissionTransfer(this.queryParams).then(response => {
        this.commissionTransferList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userCommissionId: null,
        transferUserId: null,
        transferAmount: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加佣金转出审核";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCommissionTransfer(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改佣金转出审核";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCommissionTransfer(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCommissionTransfer(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除佣金转出审核编号为"' + ids + '"的数据项？').then(function() {
        return delCommissionTransfer(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/commissionTransfer/export', {
        ...this.queryParams
      }, `commissionTransfer_${new Date().getTime()}.xlsx`)
    },

    /** 同意按钮操作 */
    handleAgree(row) {
      this.$modal.confirmWithTilte('是否确定同意申请?','同意后不可恢复').then(function() {
        return agreeTransferApply({id:row.id,transferUserId:row.transferUserId});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("同意成功");
      }).catch(() => {});
    },
    /** 拒绝按钮操作 */
    handleCancel(row) {
      this.$modal.confirmWithTilte('是否确定拒绝申请?','拒绝后不可恢复').then(function() {
        return refuseTransferApply({id:row.id,transferUserId:row.transferUserId});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("拒绝成功");
      }).catch(() => {});
    },
    tableRowClassName({row, rowIndex}) {
      if (row.status == '1') {
        return 'success-row';
      } else if(row.status == '2') {
        return 'warning-row';
      }
      return ''
    },
  }
};
</script>

<style>
.warning-row{
  background: #ecc9c9 !important;
}
.success-row{
  background: #d5eec7 !important;
}
</style>
