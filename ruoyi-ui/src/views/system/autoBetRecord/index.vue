<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="游戏ID" prop="gameId">
        <el-input
          v-model="queryParams.gameId"
          placeholder="请输入游戏ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="追停状态" prop="winStopStatus">
        <el-select v-model="queryParams.winStopStatus" placeholder="请选择追停状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_win_stop_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="追号状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择追号状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_game_auto_bet_status"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:autoBetRecord:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:autoBetRecord:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:autoBetRecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:autoBetRecord:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="autoBetRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="追号表ID" align="center" prop="id" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="起始期数" align="center" prop="startPeriods" />
      <el-table-column label="当前期数" align="center" prop="nowPeriods" />
      <el-table-column label="游戏ID" align="center" prop="gameId" />
      <el-table-column label="游戏名" align="center" prop="gameName" />
      <el-table-column label="追停状态" align="center" prop="winStopStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_win_stop_status" :value="scope.row.winStopStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="追号期数" align="center" prop="autoBetCount" />
      <el-table-column label="追号倍数" align="center" prop="autoBetTimes" />
      <el-table-column label="追号金额" align="center" prop="autoBetMoney" />
      <el-table-column label="剩余期数" align="center" prop="remainCount" />
      <el-table-column label="下注金额" align="center" prop="countMoney" />
      <el-table-column label="中奖金额" align="center" prop="winMoney" />
      <el-table-column label="中奖次数" align="center" prop="winCount" />
      <el-table-column label="追号状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_game_auto_bet_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:autoBetRecord:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:autoBetRecord:remove']"
          >删除</el-button>
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

    <!-- 添加或修改追号对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户ID" />
        </el-form-item>
        <el-form-item label="起始期数" prop="startPeriods">
          <el-input v-model="form.startPeriods" placeholder="请输入起始期数" />
        </el-form-item>
        <el-form-item label="当前期数" prop="nowPeriods">
          <el-input v-model="form.nowPeriods" placeholder="请输入当前期数" />
        </el-form-item>
        <el-form-item label="游戏ID" prop="gameId">
          <el-input v-model="form.gameId" placeholder="请输入游戏ID" />
        </el-form-item>
        <el-form-item label="游戏名" prop="gameName">
          <el-input v-model="form.gameName" placeholder="请输入游戏名" />
        </el-form-item>
        <el-form-item label="追停状态" prop="winStopStatus">
          <el-select v-model="form.winStopStatus" placeholder="请选择追停状态">
            <el-option
              v-for="dict in dict.type.sys_win_stop_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="追号期数" prop="autoBetCount">
          <el-input v-model="form.autoBetCount" placeholder="请输入追号期数" />
        </el-form-item>
        <el-form-item label="追号倍数" prop="autoBetTimes">
          <el-input v-model="form.autoBetTimes" placeholder="请输入追号倍数" />
        </el-form-item>
        <el-form-item label="追号金额" prop="autoBetMoney">
          <el-input v-model="form.autoBetMoney" placeholder="请输入追号金额" />
        </el-form-item>
        <el-form-item label="剩余期数" prop="remainCount">
          <el-input v-model="form.remainCount" placeholder="请输入剩余期数" />
        </el-form-item>
        <el-form-item label="下注金额" prop="countMoney">
          <el-input v-model="form.countMoney" placeholder="请输入下注金额" />
        </el-form-item>
        <el-form-item label="中奖金额" prop="winMoney">
          <el-input v-model="form.winMoney" placeholder="请输入中奖金额" />
        </el-form-item>
        <el-form-item label="中奖次数" prop="winCount">
          <el-input v-model="form.winCount" placeholder="请输入中奖次数" />
        </el-form-item>
        <el-form-item label="追号状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择追号状态">
            <el-option
              v-for="dict in dict.type.sys_game_auto_bet_status"
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
import { listAutoBetRecord, getAutoBetRecord, delAutoBetRecord, addAutoBetRecord, updateAutoBetRecord } from "@/api/system/autoBetRecord";

export default {
  name: "AutoBetRecord",
  dicts: ['sys_win_stop_status', 'sys_game_auto_bet_status'],
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
      // 追号表格数据
      autoBetRecordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        gameId: null,
        winStopStatus: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" }
        ],
        startPeriods: [
          { required: true, message: "起始期数不能为空", trigger: "blur" }
        ],
        nowPeriods: [
          { required: true, message: "当前期数不能为空", trigger: "blur" }
        ],
        gameId: [
          { required: true, message: "游戏ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询追号列表 */
    getList() {
      this.loading = true;
      listAutoBetRecord(this.queryParams).then(response => {
        this.autoBetRecordList = response.rows;
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
        userId: null,
        startPeriods: null,
        nowPeriods: null,
        gameId: null,
        gameName: null,
        winStopStatus: null,
        autoBetCount: null,
        autoBetTimes: null,
        autoBetMoney: null,
        remainCount: null,
        countMoney: null,
        winMoney: null,
        winCount: null,
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
      this.title = "添加追号";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAutoBetRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改追号";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAutoBetRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAutoBetRecord(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除追号编号为"' + ids + '"的数据项？').then(function() {
        return delAutoBetRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/autoBetRecord/export', {
        ...this.queryParams
      }, `autoBetRecord_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
