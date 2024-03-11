<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="游戏类别" prop="gameType">
        <el-select v-model="queryParams.gameType" placeholder="请选择游戏类别" clearable
                   @change="handleQuery">
          <el-option
            v-for="dict in dict.type.sys_game_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="游戏状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择游戏状态" clearable
                   @change="handleQuery">
          <el-option
            v-for="dict in dict.type.sys_game_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否隐藏" prop="isHidden">
        <el-select v-model="queryParams.isHidden" placeholder="请选择是否隐藏" clearable
                   @change="handleQuery">
          <el-option
            v-for="dict in dict.type.sys_yes_no"
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
          v-if="1 == loginUserId"
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
          v-if="1 == loginUserId"
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:game:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['system:game:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gameList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="游戏ID" align="center" prop="gameId" />
      <el-table-column label="游戏图片" align="center" prop="gameImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.gameImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="游戏类别" align="center" prop="gameType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_game_type" :value="scope.row.gameType"/>
        </template>
      </el-table-column>
      <el-table-column label="游戏标识ID" align="center" prop="gameMarkId" />
      <el-table-column label="游戏名" align="center" prop="gameName" />
<!--      <el-table-column label="游戏别名" align="center" prop="gameAliasName" />-->
<!--      <el-table-column label="描述" align="center" prop="gameDescribe" />-->
<!--      <el-table-column label="盈亏名" align="center" prop="profitLossName" />-->
<!--      <el-table-column label="记录表" align="center" prop="gameRecord" />-->
<!--      <el-table-column label="开奖表" align="center" prop="gameKj" />-->
      <el-table-column label="佣金" align="center" prop="gameCommission" />
<!--      <el-table-column label="2级佣金" align="center" prop="gameCommissionTwo" />-->
<!--      <el-table-column label="回水彩种" align="center" prop="gameCate" />-->
      <el-table-column label="回水" align="center" prop="gameCashback" />
      <el-table-column label="最小投注金额" align="center" prop="minBetAmount" />
      <el-table-column label="最大投注金额" align="center" prop="maxBetAmount" />
<!--      <el-table-column label="封盘秒数" align="center" prop="endTime" />-->
<!--      <el-table-column label="机器人比例" align="center" prop="robotRate" />-->
      <el-table-column label="游戏状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_game_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="是否隐藏" align="center" prop="isHidden">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.isHidden"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="排序" align="center" prop="sort" />-->
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
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
            v-if="1 == loginUserId"
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
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="游戏标识ID" prop="gameMarkId">
          <el-input v-model="form.gameMarkId" placeholder="请输入游戏标识ID" />
        </el-form-item>
        <el-form-item label="游戏图片" prop="gameImg">
          <image-upload v-model="form.gameImg"  :limit="1"/>
        </el-form-item>
        <el-form-item label="游戏类别" prop="gameType">
          <el-select v-model="form.gameType" placeholder="请选择游戏类别">
            <el-option
              v-for="dict in dict.type.sys_game_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="游戏名" prop="gameName">
          <el-input v-model="form.gameName" placeholder="请输入游戏名" />
        </el-form-item>
        <el-form-item label="游戏别名" prop="gameAliasName">
          <el-input v-model="form.gameAliasName" placeholder="请输入游戏别名" />
        </el-form-item>
        <el-form-item label="描述">
          <editor v-model="form.gameDescribe" :min-height="192"/>
        </el-form-item>
        <el-form-item label="盈亏名" prop="profitLossName">
          <el-input v-model="form.profitLossName" placeholder="请输入盈亏名" />
        </el-form-item>
        <el-form-item label="记录表" prop="gameRecord">
          <el-input v-model="form.gameRecord" placeholder="请输入记录表" />
        </el-form-item>
        <el-form-item label="开奖表" prop="gameKj">
          <el-input v-model="form.gameKj" placeholder="请输入开奖表" />
        </el-form-item>
        <el-form-item label="佣金" prop="gameCommission">
          <el-input-number v-model="form.gameCommission" :min="0" placeholder="请输入佣金"/>
        </el-form-item>
        <el-form-item label="回水" prop="gameCashback">
          <el-input-number v-model="form.gameCashback" :min="0" placeholder="请输入回水"/>
        </el-form-item>
        <el-form-item label="最小投注金额" prop="minBetAmount">
          <el-input-number v-model="form.minBetAmount" :min="0" placeholder="请输入最小投注金额" :precision="2"/>
        </el-form-item>
        <el-form-item label="最大投注金额" prop="maxBetAmount">
          <el-input-number v-model="form.maxBetAmount" :min="0" placeholder="请输入最大投注金额" :precision="2"/>
        </el-form-item>
        <el-form-item label="封盘秒数" prop="endTime">
          <el-input-number v-model="form.endTime" :min="0" placeholder="请输入封盘秒数"/>
        </el-form-item>
        <el-form-item label="机器人比例" prop="robotRate">
          <el-input-number v-model="form.robotRate" :min="0" placeholder="请输入机器人比例"/>
        </el-form-item>
        <el-form-item label="游戏状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_game_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否隐藏" prop="isHidden">
          <el-radio-group v-model="form.isHidden">
            <el-radio
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input-number v-model="form.sort" controls-position="right" :min="0" />
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
  dicts: ['sys_yes_no', 'sys_game_type', 'sys_game_status'],
  data() {
    return {
      // 登录用户ID
      loginUserId: this.$store.state.user.id,
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
        gameType: null,
        gameMarkId: null,
        gameName: null,
        gameAliasName: null,
        gameDescribe: null,
        profitLossName: null,
        gameRecord: null,
        gameKj: null,
        gameCommission: null,
        gameCommissionTwo: null,
        gameCate: null,
        gameCashback: null,
        minBetAmount: null,
        maxBetAmount: null,
        endTime: null,
        robotRate: null,
        sort: null,
        status: "0",
        isHidden: null,
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
        gameMarkId: null,
        gameName: null,
        gameAliasName: null,
        gameDescribe: null,
        profitLossName: null,
        gameRecord: null,
        gameKj: null,
        gameCommission: null,
        gameCommissionTwo: null,
        gameCate: null,
        gameCashback: null,
        minBetAmount: null,
        maxBetAmount: null,
        endTime: null,
        robotRate: null,
        roomRule: null,
        sort: null,
        status: "0",
        isHidden: "N",
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
