<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="游戏图片" prop="gameImg">
        <el-input
          v-model="queryParams.gameImg"
          placeholder="请输入游戏图片"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="压缩名" prop="gameName">
        <el-input
          v-model="queryParams.gameName"
          placeholder="请输入压缩名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="描述" prop="gameDescribe">
        <el-input
          v-model="queryParams.gameDescribe"
          placeholder="请输入描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="中文名" prop="gameChineseName">
        <el-input
          v-model="queryParams.gameChineseName"
          placeholder="请输入中文名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="盈亏名" prop="profitLossName">
        <el-input
          v-model="queryParams.profitLossName"
          placeholder="请输入盈亏名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="0开启1为关闭" prop="openoff">
        <el-input
          v-model="queryParams.openoff"
          placeholder="请输入0开启1为关闭"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="记录表" prop="gameRecord">
        <el-input
          v-model="queryParams.gameRecord"
          placeholder="请输入记录表"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开奖表" prop="gameKj">
        <el-input
          v-model="queryParams.gameKj"
          placeholder="请输入开奖表"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="佣金" prop="gameCommission">
        <el-input
          v-model="queryParams.gameCommission"
          placeholder="请输入佣金"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="2级佣金" prop="gameCommissionTwo">
        <el-input
          v-model="queryParams.gameCommissionTwo"
          placeholder="请输入2级佣金"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="回水彩种" prop="gameCate">
        <el-input
          v-model="queryParams.gameCate"
          placeholder="请输入回水彩种"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="回水" prop="gameCashback">
        <el-input
          v-model="queryParams.gameCashback"
          placeholder="请输入回水"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排序" prop="sort">
        <el-input
          v-model="queryParams.sort"
          placeholder="请输入排序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否隐藏" prop="isHidden">
        <el-input
          v-model="queryParams.isHidden"
          placeholder="请输入是否隐藏"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间模式" prop="houseOpen">
        <el-input
          v-model="queryParams.houseOpen"
          placeholder="请输入房间模式"
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
          v-hasPermi="['system:game:add']"
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
          v-hasPermi="['system:game:edit']"
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
          v-hasPermi="['system:game:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:game:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gameList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="游戏ID" align="center" prop="gameId" />
      <el-table-column label="游戏图片" align="center" prop="gameImg" />
      <el-table-column label="游戏类别" align="center" prop="gameType" />
      <el-table-column label="压缩名" align="center" prop="gameName" />
      <el-table-column label="描述" align="center" prop="gameDescribe" />
      <el-table-column label="中文名" align="center" prop="gameChineseName" />
      <el-table-column label="盈亏名" align="center" prop="profitLossName" />
      <el-table-column label="0开启1为关闭" align="center" prop="openoff" />
      <el-table-column label="记录表" align="center" prop="gameRecord" />
      <el-table-column label="开奖表" align="center" prop="gameKj" />
      <el-table-column label="佣金" align="center" prop="gameCommission" />
      <el-table-column label="2级佣金" align="center" prop="gameCommissionTwo" />
      <el-table-column label="回水彩种" align="center" prop="gameCate" />
      <el-table-column label="回水" align="center" prop="gameCashback" />
      <el-table-column label="排序" align="center" prop="sort" />
      <el-table-column label="是否隐藏" align="center" prop="isHidden" />
      <el-table-column label="房间模式" align="center" prop="houseOpen" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:game:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:game:remove']"
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

    <!-- 添加或修改游戏对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="游戏图片" prop="gameImg">
          <el-input v-model="form.gameImg" placeholder="请输入游戏图片" />
        </el-form-item>
        <el-form-item label="压缩名" prop="gameName">
          <el-input v-model="form.gameName" placeholder="请输入压缩名" />
        </el-form-item>
        <el-form-item label="描述" prop="gameDescribe">
          <el-input v-model="form.gameDescribe" placeholder="请输入描述" />
        </el-form-item>
        <el-form-item label="中文名" prop="gameChineseName">
          <el-input v-model="form.gameChineseName" placeholder="请输入中文名" />
        </el-form-item>
        <el-form-item label="盈亏名" prop="profitLossName">
          <el-input v-model="form.profitLossName" placeholder="请输入盈亏名" />
        </el-form-item>
        <el-form-item label="0开启1为关闭" prop="openoff">
          <el-input v-model="form.openoff" placeholder="请输入0开启1为关闭" />
        </el-form-item>
        <el-form-item label="记录表" prop="gameRecord">
          <el-input v-model="form.gameRecord" placeholder="请输入记录表" />
        </el-form-item>
        <el-form-item label="开奖表" prop="gameKj">
          <el-input v-model="form.gameKj" placeholder="请输入开奖表" />
        </el-form-item>
        <el-form-item label="佣金" prop="gameCommission">
          <el-input v-model="form.gameCommission" placeholder="请输入佣金" />
        </el-form-item>
        <el-form-item label="2级佣金" prop="gameCommissionTwo">
          <el-input v-model="form.gameCommissionTwo" placeholder="请输入2级佣金" />
        </el-form-item>
        <el-form-item label="回水彩种" prop="gameCate">
          <el-input v-model="form.gameCate" placeholder="请输入回水彩种" />
        </el-form-item>
        <el-form-item label="回水" prop="gameCashback">
          <el-input v-model="form.gameCashback" placeholder="请输入回水" />
        </el-form-item>
        <el-form-item label="${comment}" prop="roomRule">
          <el-input v-model="form.roomRule" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="是否隐藏" prop="isHidden">
          <el-input v-model="form.isHidden" placeholder="请输入是否隐藏" />
        </el-form-item>
        <el-form-item label="房间模式" prop="houseOpen">
          <el-input v-model="form.houseOpen" placeholder="请输入房间模式" />
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
import { listGame, getGame, delGame, addGame, updateGame } from "@/api/system/game";

export default {
  name: "Game",
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
      // 游戏表格数据
      gameList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gameImg: null,
        gameType: null,
        gameName: null,
        gameDescribe: null,
        gameChineseName: null,
        profitLossName: null,
        openoff: null,
        gameRecord: null,
        gameKj: null,
        gameCommission: null,
        gameCommissionTwo: null,
        gameCate: null,
        gameCashback: null,
        roomRule: null,
        sort: null,
        isHidden: null,
        houseOpen: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameImg: [
          { required: true, message: "游戏图片不能为空", trigger: "blur" }
        ],
        gameType: [
          { required: true, message: "游戏类别不能为空", trigger: "change" }
        ],
        gameName: [
          { required: true, message: "压缩名不能为空", trigger: "blur" }
        ],
        gameDescribe: [
          { required: true, message: "描述不能为空", trigger: "blur" }
        ],
        gameChineseName: [
          { required: true, message: "中文名不能为空", trigger: "blur" }
        ],
        profitLossName: [
          { required: true, message: "盈亏名不能为空", trigger: "blur" }
        ],
        openoff: [
          { required: true, message: "0开启1为关闭不能为空", trigger: "blur" }
        ],
        gameRecord: [
          { required: true, message: "记录表不能为空", trigger: "blur" }
        ],
        gameKj: [
          { required: true, message: "开奖表不能为空", trigger: "blur" }
        ],
        gameCommission: [
          { required: true, message: "佣金不能为空", trigger: "blur" }
        ],
        gameCommissionTwo: [
          { required: true, message: "2级佣金不能为空", trigger: "blur" }
        ],
        gameCate: [
          { required: true, message: "回水彩种不能为空", trigger: "blur" }
        ],
        gameCashback: [
          { required: true, message: "回水不能为空", trigger: "blur" }
        ],
        roomRule: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        sort: [
          { required: true, message: "排序不能为空", trigger: "blur" }
        ],
        isHidden: [
          { required: true, message: "是否隐藏不能为空", trigger: "blur" }
        ],
        houseOpen: [
          { required: true, message: "房间模式不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询游戏列表 */
    getList() {
      this.loading = true;
      listGame(this.queryParams).then(response => {
        this.gameList = response.rows;
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
        gameId: null,
        gameImg: null,
        gameType: null,
        gameName: null,
        gameDescribe: null,
        gameChineseName: null,
        profitLossName: null,
        openoff: null,
        gameRecord: null,
        gameKj: null,
        gameCommission: null,
        gameCommissionTwo: null,
        gameCate: null,
        gameCashback: null,
        roomRule: null,
        sort: null,
        isHidden: null,
        houseOpen: null,
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
      this.ids = selection.map(item => item.gameId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加游戏";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const gameId = row.gameId || this.ids
      getGame(gameId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改游戏";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.gameId != null) {
            updateGame(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGame(this.form).then(response => {
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
      const gameIds = row.gameId || this.ids;
      this.$modal.confirm('是否确认删除游戏编号为"' + gameIds + '"的数据项？').then(function() {
        return delGame(gameIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/game/export', {
        ...this.queryParams
      }, `game_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
