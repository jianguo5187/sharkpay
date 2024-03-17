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
      <el-form-item label="机器人昵称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入机器人昵称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机器人账号" prop="user">
        <el-input
          v-model="queryParams.user"
          placeholder="请输入机器人账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="falseUserList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Id" align="center" prop="id" />
      <el-table-column label="游戏" align="center" prop="gameName" />
      <el-table-column label="机器人昵称" align="center" prop="userName" />
      <el-table-column label="机器人账号" align="center" prop="user" />
      <el-table-column label="机器人头像" align="center" prop="robotPic" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.robotPic" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="机器人投注金额" align="center" prop="robotBetMoney" />
      <el-table-column label="机器人投注号码" align="center" prop="robotBetNum" />
      <el-table-column label="机器人投注时间" align="center" prop="robotBetTime" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
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

    <!-- 添加或修改投注机器人对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
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
        <el-form-item label="机器人账号" prop="user">
          <el-input v-model="form.user" placeholder="请输入机器人账号" />
          <span style="color: red">*必须为字母数字组合，且不能重复！否则假人无效！</span>
        </el-form-item>
        <el-form-item label="机器人昵称" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入机器人昵称" />
        </el-form-item>
        <el-form-item label="机器人等级id" prop="groupId">
          <el-input-number v-model="form.groupId" :min="0" placeholder="请输入机器人等级id"/>
        </el-form-item>
        <el-form-item label="机器人头像" prop="robotPic">
          <image-upload v-model="form.robotPic" :limit="1"/>
        </el-form-item>
        <el-form-item label="机器人投注金额" prop="robotBetMoney">
          <el-input v-model="form.robotBetMoney" placeholder="请输入机器人投注金额" />
          <span>(拿竖线拼接例如：100|200|300)</span>
        </el-form-item>
        <el-form-item label="机器人投注号码" prop="robotBetNum">
          <el-input v-model="form.robotBetNum" placeholder="请输入机器人投注号码" />
          <span>(拿竖线拼接例如：大|小|双)</span>
        </el-form-item>
        <el-form-item label="机器人投注时间" prop="robotBetTime">
          <el-input v-model="form.robotBetTime" placeholder="请输入机器人投注时间" />
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
import { listFalseUser, getFalseUser, delFalseUser, addFalseUser, updateFalseUser } from "@/api/system/falseUser";
import {getValidGame} from "@/api/system/game";

export default {
  name: "FalseUser",
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
      falseUserList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        userName: null,
        user: null,
        gameId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        user: [
          { required: true, message: "机器人账号不能为空", trigger: "blur" },
          {
            pattern: /^[a-zA-Z0-9]+$/,
            message: "请输入正确的机器人账号(只能输入英数字)",
            trigger: "blur"
          }
        ],
        userName: [
          { required: true, message: "机器人昵称不能为空", trigger: "blur" }
        ],
        robotBetMoney: [
          { required: true, message: "机器人投注金额不能为空", trigger: "blur" }
        ],
        robotBetNum: [
          { required: true, message: "机器人投注号码不能为空", trigger: "blur" }
        ],
        gameId: [
          { required: true, message: "机器人投注游戏类型不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    /** 查询投注机器人列表 */
    getList() {
      this.loading = true;
      listFalseUser(this.queryParams).then(response => {
        this.falseUserList = response.rows;
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
        userName: null,
        user: null,
        robotPic: null,
        robotBetMoney: null,
        robotBetNum: null,
        robotBetTime: null,
        gameId: null,
        groupId: "1",
        playType: null,
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
      this.title = "添加投注机器人";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFalseUser(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改投注机器人";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFalseUser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFalseUser(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除投注机器人编号为"' + ids + '"的数据项？').then(function() {
        return delFalseUser(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/falseUser/export', {
        ...this.queryParams
      }, `falseUser_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
