<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="游戏" prop="gameId">
        <el-select v-model="queryParams.gameId" placeholder="请选择游戏" @change="handleQuery">
          <el-option
            clearable
            v-for="item in gameListOptions"
            :key="item.gameId"
            :label="item.gameName"
            :value="item.gameId"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="期数" prop="periods">
        <el-input
          v-model="queryParams.periods"
          placeholder="请输入期数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="开奖状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择开奖状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_kj_status"
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

    <el-table v-loading="loading" :data="betkjList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="期数" width="85" align="center" prop="periods" />
      <el-table-column label="开奖时间" align="center" prop="betOpenTime" />
      <el-table-column label="是否已经开奖" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_kj_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="开奖号码" align="center" prop="openResult" />
      <el-table-column label="下注金额" align="center" prop="countMoney" />
      <el-table-column label="中奖金额" align="center" prop="winMoney" />
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--          >详情</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改开奖对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="封盘投注截止时间" prop="betTime">
          <el-date-picker clearable
                          v-model="form.betTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择封盘投注截止时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预计开奖时间" prop="preTime">
          <el-date-picker clearable
                          v-model="form.preTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择预计开奖时间">
          </el-date-picker>
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
import { listBetkj, getBetkj} from "@/api/system/betkj";
import {getValidGame} from "@/api/system/game";

export default {
  name: "Betkj",
  dicts: ['sys_kj_status'],
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
      // 开奖表格数据
      betkjList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        gameId: null,
        status: null,
        periods: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏ID不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    /** 查询开奖列表 */
    getList() {
      this.loading = true;
      listBetkj(this.queryParams).then(response => {
        this.betkjList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        if(response.gameList.length > 0){
          this.queryParams.gameId = response.gameList[0].gameId
        }
        this.getList();
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
        status: null,
        betTime: null,
        preTime: null,
        theTime: null,
        countMoney: null,
        winMoney: null,
        num1: null,
        num2: null,
        num3: null,
        num4: null,
        num5: null,
        sum: null,
        num1Bs: null,
        num1Sd: null,
        num2Bs: null,
        num2Sd: null,
        num3Bs: null,
        num3Sd: null,
        num4Bs: null,
        num4Sd: null,
        num5Bs: null,
        num5Sd: null,
        sumBs: null,
        sumSd: null,
        sumLts: null,
        numF: null,
        numM: null,
        numB: null,
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
      this.title = "添加开奖";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getBetkj(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改开奖";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBetkj(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBetkj(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除开奖编号为"' + ids + '"的数据项？').then(function() {
        return delBetkj(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/betkj/export', {
        ...this.queryParams
      }, `betkj_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
