<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
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
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_replace_status"
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
        >新增</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
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
<!--          v-hasPermi="['system:robotBetOption:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="robotBetOptionList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="游戏" align="center" prop="gameName" />
      <el-table-column label="投注类别/号码/金额" align="center" prop="betItemOption" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_replace_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
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

    <!-- 添加或修改机器人话术对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form @submit.native.prevent ref="form" :model="form" :rules="rules" label-width="180px">
        <el-form-item label="游戏" prop="gameId">
          <el-select v-model="form.gameId" placeholder="请选择游戏">
            <el-option
              clearable
              v-for="item in gameListOptions"
              :key="item.gameId"
              :label="item.gameName"
              :value="item.gameId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="话术" prop="betItemOption">
          <el-input v-model="form.betItemOption" placeholder="请输入话术" @keyup.enter.native="submitForm"/>
          <span>投注类别|号码1,号码2,号码3|金额(拿竖线拼接例如：特殊|对子,顺子,豹子|70)</span>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_replace_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRobotBetOption, getRobotBetOption, delRobotBetOption, addRobotBetOption, updateRobotBetOption } from "@/api/system/robotBetOption";
import {getValidGame} from "@/api/system/game";

export default {
  name: "RobotBetOption",
  dicts: ['sys_replace_status'],
  data() {
    const minMaxBetCountCheck = (rule, value, callback) => {
      console.log("value")
      var checkReuslt = true;
      if(value.split("|").length != 3){
        checkReuslt = false;
      }else{
        if(value.split("|")[0] == "" || value.split("|")[1] == "" || value.split("|")[2] == ""){
          checkReuslt = false;
        }
      }
      if (!checkReuslt) {
        callback(new Error("输入的话术不规范，请用|隔开"));
      } else {
        callback();
      }
    };
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
      // 机器人话术表格数据
      robotBetOptionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        gameId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "彩种不能为空", trigger: "blur" }
        ],
        betItemOption: [
          { required: true, message: "话术不能为空", trigger: "blur" },
          { required: true, validator: minMaxBetCountCheck, trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        if(response.gameList.length > 0){
          this.queryParams.gameId = response.gameList[0].gameId
        }
        this.getList();
      });
    },
    /** 查询机器人话术列表 */
    getList() {
      this.loading = true;
      listRobotBetOption(this.queryParams).then(response => {
        this.robotBetOptionList = response.rows;
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
        gameId: null,
        betItemOption: null,
        status: '0',
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
      this.title = "添加机器人话术";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRobotBetOption(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改机器人话术";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRobotBetOption(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRobotBetOption(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除机器人话术编号为"' + ids + '"的数据项？').then(function() {
        return delRobotBetOption(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/robotBetOption/export', {
        ...this.queryParams
      }, `robotBetOption_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
