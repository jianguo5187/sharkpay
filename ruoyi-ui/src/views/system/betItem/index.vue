<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="98px">
      <el-row :gutter="20">
        <el-form-item label="游戏" prop="gameId">
          <el-select v-model="queryParams.gameId" placeholder="请选择游戏" @change="getBetTypeList">
            <el-option
              clearable
              v-for="item in gameListOptions"
              :key="item.gameId"
              :label="item.gameName"
              :value="item.gameId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="success" icon="el-icon-edit" size="mini" @click="handleGameUpdate">编辑</el-button>
        </el-form-item>
      </el-row>
      <el-row :gutter="20">
        <el-form-item label="游戏投注类型" prop="betItemType">
          <el-select v-model="queryParams.betItemType" placeholder="请选择游戏投注类型" @change="handleQuery">
            <el-option
              clearable
              v-for="item in betTypeListOptions"
              :key="item.betTypeId"
              :label="item.betTypeName"
              :value="item.betTypeId"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-row>

    </el-form>

    <el-row :gutter="10" class="mb8" v-if="1 == loginUserId">
      <el-col :span="1.5">
        <el-button
          v-if="1 == loginUserId"
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增</el-button>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="well codes">
      <el-col :span="4" v-for="(item, index) in betItemList" :key="index">
        <div class="panel panel-default codes_cell">
          <div class="panel-heading">
            <h3 class="panel-title">{{ item. betItemName}}</h3><small>(pf_jnd28)</small>
          </div>
          <div class="panel-body  text-center">
            选项 <span class="badge bg-success">{{ item. betItemName}}</span>
            赔率 <span class="badge bg-success">{{ item. odd}}</span>
          </div>
          <div class="panel-footer bg-info   text-center">
            <a title="编辑" icon="fa fa-plus-circle" class="btn btn-warning pop edit_lt_type" @click="handleUpdate(item)">编辑</a>
          </div>
        </div>
      </el-col>
    </el-row>

    <!-- 添加或修改游戏投注项对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px">
        <el-form-item label="游戏" prop="gameId">
          <el-select v-model="form.gameId" placeholder="请选择游戏"  disabled="false">
            <el-option
              clearable
              v-for="item in gameListOptions"
              :key="item.gameId"
              :label="item.gameName"
              :value="item.gameId"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="游戏投注类型" prop="betItemType">
          <el-select v-model="form.betItemType" placeholder="请选择游戏投注类型" disabled="false">
            <el-option
              clearable
              v-for="item in formBetTypeListOptions"
              :key="item.betTypeId"
              :label="item.betTypeName"
              :value="item.betTypeId"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="投注项Code" prop="betItemCode" >
          <el-input v-model="form.betItemCode" placeholder="请输入投注项Code" :disabled="1 != loginUserId"/>
        </el-form-item>
        <el-form-item label="投注项名" prop="betItemName">
          <el-input v-model="form.betItemName" placeholder="请输入投注项名" />
        </el-form-item>
        <el-form-item label="特色定义内容" prop="betItemDescribe">
          <el-input v-model="form.betItemDescribe" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="赔率" prop="odd">
          <el-input-number v-model="form.odd" :min="0" placeholder="请输入赔率" :precision="2"/>
        </el-form-item>
        <el-form-item label="最小投注金额" prop="minBetAmount">
          <el-input-number v-model="form.minBetAmount" :min="0" placeholder="请输入最小投注金额" :precision="2"/>
        </el-form-item>
        <el-form-item label="最大投注金额" prop="maxBetAmount">
          <el-input-number v-model="form.maxBetAmount" :min="0" placeholder="请输入最大投注金额" :precision="2"/>
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

    <!-- 添加或修改游戏对话框 -->
    <el-dialog :title="title" :visible.sync="gameFormOpen" width="800px" append-to-body>
      <el-form ref="gameForm" :model="gameForm" :rules="gameRules" label-width="120px">
        <el-form-item label="游戏标识ID" prop="gameMarkId">
          <el-input v-model="gameForm.gameMarkId" placeholder="请输入游戏标识ID" :disabled="1 != loginUserId"/>
        </el-form-item>
        <el-form-item label="游戏图片" prop="gameImg">
          <image-upload v-model="gameForm.gameImg"  :limit="1"/>
        </el-form-item>
        <el-form-item label="游戏类别" prop="gameType">
          <el-select v-model="gameForm.gameType" placeholder="请选择游戏类别" :disabled="1 != loginUserId">
            <el-option
              v-for="dict in dict.type.sys_game_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="游戏名" prop="gameName">
          <el-input v-model="gameForm.gameName" placeholder="请输入游戏名" />
        </el-form-item>
        <el-form-item label="游戏别名" prop="gameAliasName">
          <el-input v-model="gameForm.gameAliasName" placeholder="请输入游戏别名" />
        </el-form-item>
        <el-form-item label="描述">
          <editor v-model="gameForm.gameDescribe" :min-height="192"/>
        </el-form-item>
<!--        <el-form-item label="盈亏名" prop="profitLossName">-->
<!--          <el-input v-model="gameForm.profitLossName" placeholder="请输入盈亏名" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="记录表" prop="gameRecord">-->
<!--          <el-input v-model="gameForm.gameRecord" placeholder="请输入记录表" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="开奖表" prop="gameKj">-->
<!--          <el-input v-model="gameForm.gameKj" placeholder="请输入开奖表" />-->
<!--        </el-form-item>-->
        <el-form-item label="佣金" prop="gameCommission">
          <el-input-number v-model="gameForm.gameCommission" :min="0" placeholder="请输入佣金"/>
        </el-form-item>
        <el-form-item label="回水" prop="gameCashback">
          <el-input-number v-model="gameForm.gameCashback" :min="0" placeholder="请输入回水"/>
        </el-form-item>
        <el-form-item label="最小投注金额" prop="minBetAmount">
          <el-input-number v-model="gameForm.minBetAmount" :min="0" placeholder="请输入最小投注金额" :precision="2"/>
        </el-form-item>
        <el-form-item label="最大投注金额" prop="maxBetAmount">
          <el-input-number v-model="gameForm.maxBetAmount" :min="0" placeholder="请输入最大投注金额" :precision="2"/>
        </el-form-item>
        <el-form-item label="封盘秒数" prop="endTime">
          <el-input-number v-model="gameForm.endTime" :min="0" placeholder="请输入封盘秒数"/>
        </el-form-item>
        <el-form-item label="机器人比例" prop="robotRate">
          <el-input-number v-model="gameForm.robotRate" :min="0" placeholder="请输入机器人比例"/>
        </el-form-item>
        <el-form-item label="游戏有效开奖开始时间" prop="validOpenStartTime">
          <el-input v-model="gameForm.validOpenStartTime" placeholder="请输入游戏有效开奖开始时间" /> (例如8点->0800)
        </el-form-item>
        <el-form-item label="游戏有效开奖结束时间" prop="validOpenEndTime">
          <el-input v-model="gameForm.validOpenEndTime" placeholder="请输入游戏有效开奖结束时间" /> (例如23点59分->2359)
        </el-form-item>
        <el-form-item label="游戏状态" prop="status">
          <el-radio-group v-model="gameForm.status">
            <el-radio
              v-for="dict in dict.type.sys_game_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否隐藏" prop="isHidden">
          <el-radio-group v-model="gameForm.isHidden">
            <el-radio
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input-number v-model="gameForm.sort" controls-position="right" :min="0" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="gameFormSubmitForm">确 定</el-button>
        <el-button @click="gameFormCancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { betItemList, getBetItem, delBetItem, addBetItem, updateBetItem } from "@/api/system/betItem";
import {addGame, getGame, getValidGame, updateGame} from "@/api/system/game";
import {getValidBetType} from "@/api/system/betType";

export default {
  name: "BetItem",
  dicts: ['sys_bet_item_status','sys_game_status','sys_yes_no','sys_game_type'],
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
      // 游戏投注项表格数据
      betItemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      gameListOptions:[],
      betTypeListOptions:[],
      formBetTypeListOptions:[],
      // 查询参数
      queryParams: {
        // pageNum: 1,
        // pageSize: 10,
        gameId: null,
        betItemType: null,
        betItemName: null,
        betItemDescribe: null,
        odd: null,
        minBetAmount: null,
        maxBetAmount: null,
        sort: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        gameId: [
          { required: true, message: "游戏ID不能为空", trigger: "blur" }
        ],
        betItemType: [
          { required: true, message: "投注项类别不能为空", trigger: "change" }
        ],
        betItemCode: [
          { required: true, message: "投注项cd不能为空", trigger: "blur" }
        ],
        betItemName: [
          { required: true, message: "投注项名不能为空", trigger: "blur" }
        ],
      },
      // 是否显示弹出层
      gameFormOpen: false,
      // 编辑游戏表单参数
      gameForm: {},
      // 游戏表单校验
      gameRules: {
        validOpenStartTime: [
          { required: true, message: "游戏有效开奖开始时间不能为空", trigger: "blur" }
        ],
        validOpenEndTime: [
          { required: true, message: "游戏游戏有效开奖结束时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getGameList();
  },
  methods: {
    /** 查询游戏投注项列表 */
    getList() {
      this.loading = true;
      betItemList(this.queryParams).then(response => {
        this.betItemList = response.betItemList;
        // this.total = response.total;
        this.loading = false;
      });
    },
    getGameList(){
      getValidGame().then(response => {
        this.gameListOptions = response.gameList;
        if(response.gameList.length > 0){
          this.queryParams.gameId = response.gameList[0].gameId
        }
        this.getBetTypeList();
      });
    },
    getBetTypeList(){
      getValidBetType({"gameId":this.queryParams.gameId}).then(response => {
        // 检索
        this.queryParams.betItemType = null;

        this.betTypeListOptions = response.betTypeList;
        if(response.betTypeList.length > 0){
          this.queryParams.betItemType = response.betTypeList[0].betTypeId
        }
        this.getList();
      });
    },
    fromGameChange(){
      this.form.betItemType = null;
      this.getFormBetTypeList();
    },
    getFormBetTypeList(){
      getValidBetType({"gameId":this.form.gameId}).then(response => {
        // 编辑·新规
        this.formBetTypeListOptions = response.betTypeList;
        console.log(1);
        // if(response.betTypeList.length > 0 && this.form.betItemType == null){
        //   this.form.betItemType = response.betTypeList[0].betTypeId
        // }else if(this.form.betItemType != null){
        //   this.formBetTypeListOptions.forEach(item=>{
        //     if(item.betTypeId == this.form.betItemType){
        //       this.form.betItemType = item.betTypeId;
        //       return;
        //     }
        //   });
        // }
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
        betItemId: null,
        gameId: null,
        betItemType: null,
        betItemCode: null,
        betItemName: null,
        betItemDescribe: null,
        odd: null,
        minBetAmount: null,
        maxBetAmount: null,
        sort: 0,
        status: "0",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 取消按钮
    gameFormCancel() {
      this.gameFormOpen = false;
      this.gameFormRest();
    },
    gameFormRest(){
      this.gameForm = {
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
        validOpenStartTime: "0000",
        validOpenEndTime: "2359",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("gameForm");
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
      this.ids = selection.map(item => item.betItemId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加游戏投注项";
    },
    /** 游戏修改按钮操作 */
    handleGameUpdate(){
      this.gameFormRest();
      const gameId = this.queryParams.gameId;
      getGame(gameId).then(response => {
        this.gameForm = response.data;
        this.gameFormOpen = true;
        this.title = "编辑游戏";
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      console.log(1);
      this.reset();
      const betItemId = row.betItemId || this.ids
      getBetItem(betItemId).then(response => {
        this.form = response.data;
        this.getFormBetTypeList();
        this.open = true;
        this.title = "编辑";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.betItemId != null) {
            updateBetItem(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBetItem(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 提交按钮 */
    gameFormSubmitForm() {
      this.$refs["gameForm"].validate(valid => {
        if (valid) {
          if (this.gameForm.gameId != null) {
            updateGame(this.gameForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.gameFormOpen = false;
              this.getList();
            });
          } else {
            addGame(this.gameForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.gameFormOpen = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const betItemIds = row.betItemId || this.ids;
      this.$modal.confirm('是否确认删除游戏投注项编号为"' + betItemIds + '"的数据项？').then(function() {
        return delBetItem(betItemIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/betItem/export', {
        ...this.queryParams
      }, `betItem_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

<style lang="scss" scoped>
.panel {
  border-radius: 3px;
  -webkit-box-shadow: none;
  box-shadow: none;
}
.panel-default {
  border-color: #f0f0f0;
}
.panel-default > .panel-heading {
  color: #646464;
  background-color: #f9f9f9;
  border-color: #f0f0f0;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body {
  border-top-color: #f0f0f0;
}
.panel-default > .panel-heading .badge {
  color: #f9f9f9;
  background-color: #646464;
}
.panel-default > .panel-heading a {
  font-weight: 400;
}
.panel-default > .panel-heading a:hover,
.panel-default > .panel-heading a:focus {
  color: #4a4a4a;
}
.panel-default > .panel-footer + .panel-collapse > .panel-body {
  border-bottom-color: #f0f0f0;
}
.codes_cell {
  margin-top: 20px;
}
.panel-heading {
  overflow: hidden;
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px
}
.panel-body {
  padding: 15px;
  background-color: white;
}
.text-center {
  text-align: center;
}
.panel-footer {
  padding: 10px 15px;
  background-color: #f5f5f5;
  border-top: 1px solid #ddd;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px;
}
.bg-info {
  background-color: #70b9eb;
}
.btn-warning {
  color: #fff;
  background-color: #f3b760;
  border-color: #efa231;
}
.panel-title {
  margin-top: 0;
  margin-bottom: 0;
  font-size: 16px;
  color: inherit;
  font-weight: bold;
}

.panel-title>.small,.panel-title>.small>a,.panel-title>a,.panel-title>small,.panel-title>small>a {
  color: inherit
}

.badge {
  display: inline-block;
  min-width: 10px;
  padding: 3px 7px;
  font-size: 12px;
  font-weight: 700;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  background-color: #777;
  border-radius: 10px
}

.badge:empty {
  display: none
}
.btn, .form-control {
  border-radius: 0;
}
.bg-success {
  background-color: #46c37b;
}

.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px
}

.well {
  min-height: 20px;
  padding: 19px;
  margin-bottom: 20px;
  background-color: #f5f5f5;
  border: 1px solid #e3e3e3;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
  box-shadow: inset 0 1px 1px rgba(0,0,0,.05)
}

.well blockquote {
  border-color: #ddd;
  border-color: rgba(0,0,0,.15)
}

.well-lg {
  padding: 24px;
  border-radius: 6px
}

.well-sm {
  padding: 9px;
  border-radius: 3px
}
</style>

