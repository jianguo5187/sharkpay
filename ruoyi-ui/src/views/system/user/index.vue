<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--用户数据-->
      <el-col :span="24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
          <el-form-item label="用户ID" prop="userId">
            <el-input
              v-model="queryParams.userId"
              placeholder="请输入用户ID"
              clearable
              style="width: 240px"
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
          <el-form-item label="状态" prop="status">
            <el-select
              v-model="queryParams.status"
              placeholder="用户状态"
              clearable
              @change="handleQuery"
              style="width: 240px"
            >
              <el-option
                v-for="dict in dict.type.sys_normal_disable"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              style="width: 240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
            ></el-date-picker>
          </el-form-item>

          <el-form-item label="只看子账号" prop="onlyChildAdminFlg">
            <el-switch v-model="queryParams.onlyChildAdminFlg" @change="handleQuery"></el-switch>
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
              v-if="loginUserId == 1 || loginUserId == 2 || loginUserId == 3"
            >添加子账号</el-button>
          </el-col>
<!--          <el-col :span="1.5">-->
<!--            <el-button-->
<!--              type="success"-->
<!--              plain-->
<!--              icon="el-icon-edit"-->
<!--              size="mini"-->
<!--              :disabled="single"-->
<!--              @click="handleUpdate"-->
<!--              v-hasPermi="['system:user:edit']"-->
<!--            >修改</el-button>-->
<!--          </el-col>-->
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange" @sort-change='sortTableFun'>
<!--          <el-table-column type="selection" width="50" align="center" />-->
          <el-table-column label="用户ID" align="center" key="userId" prop="userId" width="80" sortable="custom"/>
          <!--          <el-table-column label="用户编号" align="center" key="userId" prop="userId" v-if="columns[0].visible" />-->
<!--          <el-table-column label="登录账号" align="center" key="userName" prop="userName" :show-overflow-tooltip="true" />-->
          <el-table-column label="用户昵称" align="center" key="nickName" prop="nickName" :show-overflow-tooltip="true" />
          <el-table-column label="用户备注名" align="center" key="remarkName" prop="remarkName" :show-overflow-tooltip="true">
            <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  @click="handleUpdateRemarkName(scope.row)"
                >
                  <span v-if="scope.row.remarkName != null">
                    {{ scope.row.remarkName }}
                  </span>
                  <span v-else style="color: red">空值</span>
                </el-button>
            </template>
          </el-table-column>
          <el-table-column label="头像" align="center" prop="avatar" width="100">
            <template slot-scope="scope">
              <image-preview :src="scope.row.avatar" :width="50" :height="50" v-if="scope.row.avatar != null && scope.row.avatar != ''"/>
            </template>
          </el-table-column>
          <el-table-column label="上级用户" align="center" key="parentUserId" prop="parentNickName" sortable="custom">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                @click="handleUpdateParent(scope.row)"
              >
                  <span v-if="scope.row.parentNickName != null">
                    {{ scope.row.parentNickName }}
                  </span>
                <span v-else>无</span>
              </el-button>
            </template>
          </el-table-column>
          <el-table-column label="余额" align="center" key="amount" prop="amount" sortable="custom"/>
          <el-table-column label="今日赢亏" align="center" key="todayWinMoney" prop="todayWinMoney" sortable="custom"/>
          <el-table-column label="注册时间" align="center" key="createTime" prop="createTime" sortable="custom"/>
<!--          <el-table-column label="流水金额" align="center" key="totalBetMoney" prop="totalBetMoney"/>-->
          <el-table-column label="最后登录时间" align="center" key="loginDate" prop="loginDate" sortable="custom"/>
          <el-table-column label="最后登录IP" align="center" key="loginIp" prop="loginIp"/>
          <el-table-column label="状态" align="center" prop="status" sortable="custom">
            <template slot-scope="scope">
              <dict-tag :options="dict.type.sys_user_status" :value="scope.row.status"/>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="230"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <el-button
                title="修改"
                circle
                size="small"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                v-hasPermi="['system:user:edit']"
              ></el-button>
              <el-button
                title="重置密码"
                size="small"
                circle
                icon="el-icon-key"
                @click="handleResetPwd(scope.row)"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                v-hasPermi="['system:user:resetPwd']"
              ></el-button>
              <el-button
                title="修改金额"
                circle
                size="small"
                icon="el-icon-postcard"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                @click="handleUpdateUserAmount(scope.row)"
              ></el-button>
              <el-button
                title="流水详情"
                circle
                size="small"
                icon="el-icon-bank-card"
                @click="showUserFlowDetailList(scope.row)"
              ></el-button>
              <el-button
                title="投注记录"
                circle
                size="small"
                icon="el-icon-burger"
                @click="showUserBetDetailList(scope.row)"
              ></el-button>
              <el-button
                title="冻结/解冻账号"
                circle
                size="small"
                icon="el-icon-s-check"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                @click="handleFreezeUser(scope.row)"
              ></el-button>
              <el-button
                title="账号合并"
                circle
                size="small"
                icon="el-icon-money"
                v-if="scope.row.userId !== 1 && scope.row.userId !== 2 && scope.row.userId !== 3"
                @click="handleMergeUser(scope.row)"
              ></el-button>
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
      </el-col>
    </el-row>

    <!-- 添加或修改用户配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户昵称" prop="nickName">
              <el-input v-model="form.nickName" placeholder="请输入用户昵称" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12" v-show="false">
            <el-form-item label="归属商户" prop="deptId" >
              <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属商户" :readOnly="true" disabled/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" placeholder="请输入邮箱" maxlength="50" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item v-if="form.userId == undefined" label="登录账号" prop="userName">
              <el-input v-model="form.userName" placeholder="请输入登录账号" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="form.userId == undefined" label="用户密码" prop="password">
              <el-input v-model="form.password" placeholder="请输入用户密码" type="password" maxlength="20" show-password/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.userId != undefined" >
          <el-col :span="12">
            <el-form-item label="余额" prop="amount">
              <el-input v-model="form.amount" readonly :disabled="true"/>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-show="false">
            <el-form-item label="积分" prop="score">
              <el-input v-model="form.score" readonly :disabled="true"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item v-if="form.userId != undefined" label="邀请码" prop="inviteCode">
              <el-input v-model="form.inviteCode" readonly :disabled="true"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="form.userId != undefined" label="钱包地址" prop="walletAddress">
              <el-input v-model="form.walletAddress" readonly :disabled="true"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item label="身份证名字" prop="realName">
              <el-input v-model="form.realName" placeholder="请输入身份证名字" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证号码" prop="idcardNo">
              <el-input v-model="form.idcardNo" placeholder="请输入身份证号码" maxlength="18" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item label="身份证正面" prop="idcardFrontImg">
              <imageUpload v-model="form.idcardFrontImg" :imgUrl="form.idcardFrontImg" :limit="1"></imageUpload>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证反面" prop="idcardBackImg">
              <imageUpload v-model="form.idcardBackImg" :imgUrl="form.idcardBackImg" :limit="1"></imageUpload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="24">
            <el-form-item label="3球佣金比率" prop="threeBallCommission">
              <el-input-number v-model="form.threeBallCommission" :min="0" :max="100" placeholder="请输入3球佣金比率"/> 0~100【0->不反佣  、 100->按照游戏返佣】
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item label="5球佣金比率" prop="fiveBallCommission">
              <el-input-number v-model="form.fiveBallCommission" :min="0" :max="100" placeholder="请输入5球佣金比率"/> 0~100
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="10球佣金比率" prop="tenBallCommission">
              <el-input-number v-model="form.tenBallCommission" :min="0" :max="100" placeholder="请输入10球佣金比率"/> 0~100
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="24">
            <el-form-item label="3球反水比率" prop="threeBallCashback">
              <el-input-number v-model="form.threeBallCashback" :min="0" :max="100" placeholder="请输入3球反水比率"/> 0~100【0->不反水  、 100->按照游戏返水】
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item label="5球反水比率" prop="fiveBallCashback">
              <el-input-number v-model="form.fiveBallCashback" :min="0" :max="100" placeholder="请输入5球反水比率"/> 0~100
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="10球反水比率" prop="tenBallCashback">
              <el-input-number v-model="form.tenBallCashback" :min="0" :max="100" placeholder="请输入10球反水比率"/> 0~100
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="测试用户">
              <el-radio-group v-model="form.isTest">
                <el-radio
                  v-for="dict in dict.type.sys_user_is_test"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="头像" prop="avatar">
              <imageUpload v-model="form.avatar" :imgUrl="form.avatar" :limit="1"></imageUpload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12" v-show="false">
            <el-form-item label="用户性别">
              <el-select v-model="form.sex" placeholder="请选择性别">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="12">
            <el-form-item label="角色">
              <el-select v-model="form.roleIds" multiple placeholder="请选择角色" :readOnly="true" :disabled="true">
                <el-option
                  v-for="item in roleOptions"
                  :key="item.roleId"
                  :label="item.roleName"
                  :value="item.roleId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="false">
          <el-col :span="24">
            <el-form-item label="个性签名">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入个性签名"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 合并账户对话框 -->
    <el-dialog :title="merge.title" :visible.sync="merge.open" width="800px" append-to-body>
      <el-row>
        <el-col :span="24">
          <span style="color: red;">注意，账号合并后。被合并账号的余额以及下级用户合并到主用户中，被合并用户消失，无法使用</span>
        </el-col>
      </el-row>
      <el-form ref="mergeForm" :model="merge.form" :rules="merge.rules" label-width="120px" >
        <el-row>
          <el-col :span="24">
            <el-form-item label="主用户" prop="userId">
              <treeselect
                readonly="true"
                v-model="merge.form.userId"
                :options="userListOptions"
                :normalizer="normalizer"
                :show-count="true"
                placeholder="请选择用户"
                style="width: 320px;"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="被合并用户" prop="mergeUserId">
              <treeselect
                v-model="merge.form.mergeUserId"
                :options="userListOptions"
                :normalizer="normalizer"
                :show-count="true"
                placeholder="请选择用户"
                style="width: 320px;"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitMergeUser">确 定</el-button>
        <el-button @click="merge.open = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 冻结/解冻账号 -->
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

    <!-- 冻结/解冻账号 -->
    <el-dialog :title="status.title" :visible.sync="status.open" width="500px" append-to-body>
      <el-form ref="freezeUserForm" :model="status.form" :rules="status.rules" label-width="120px">
        <el-form-item label="状态" prop="status">
          <el-select v-model="status.form.status" placeholder="请选择状态">
            <el-option
              v-for="dict in dict.type.sys_user_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFreezeUserForm">确 定</el-button>
        <el-button @click="status.open = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport" /> 是否更新已经存在的用户数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
        </div>
      </el-upload>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="userFlowMoney.title" :visible.sync="userFlowMoney.open" width="1400px" append-to-body>
      <user-flow-money-list :user="userFlowMoney.user"/>
    </el-dialog>

    <el-dialog :title="userBet.title" :visible.sync="userBet.open" width="1400px" append-to-body>
      <bet-real-time :user="userBet.user"/>
    </el-dialog>


    <!-- 添加子管理员用户配置对话框 -->
    <el-dialog :title="addChildAdmin.title" :visible.sync="addChildAdmin.open" width="1000px" append-to-body>
      <el-form ref="addChildAdminForm" :model="addChildAdmin.form" :rules="addChildAdmin.rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户昵称" prop="nickName">
              <el-input v-model="addChildAdmin.form.nickName" placeholder="请输入用户昵称" maxlength="30" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item v-if="addChildAdmin.form.userId == undefined" label="登录账号" prop="userName">
              <el-input v-model="addChildAdmin.form.userName" placeholder="请输入登录账号" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="addChildAdmin.form.userId == undefined" label="用户密码" prop="password">
              <el-input v-model="addChildAdmin.form.password" placeholder="请输入用户密码" type="password" maxlength="20" show-password/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="测试用户">
              <el-radio-group v-model="addChildAdmin.form.isTest">
                <el-radio
                  v-for="dict in dict.type.sys_user_is_test"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态">
              <el-radio-group v-model="addChildAdmin.form.status">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAddChildAdminForm">确 定</el-button>
        <el-button @click="addChildAdmin.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listUser,
  getUser,
  delUser,
  addUser,
  updateUser,
  resetUserPwd,
  resetUserPayPwd,
  changeUserStatus,
  deptTreeSelect, resetUserRemarkName, selectAllUser, mergeUser, addChildAdminUser, resetUserParentUserId
} from "@/api/system/user";
import { getToken } from "@/utils/auth";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {getValidGame} from "@/api/system/game";
import {adminPostal} from "@/api/system/postal";
import {adminRecharge} from "@/api/system/recharge";
import UserFlowMoneyList from "@/views/system/userMoney"
import BetRealTime from "@/views/system/bet/betRealTime"

export default {
  name: "User",
  dicts: ['sys_normal_disable', 'sys_user_sex', 'user_type','sys_user_status','sys_user_is_test'],
  components: { Treeselect ,UserFlowMoneyList,BetRealTime},
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
      // 用户表格数据
      userList: null,
      // 弹出层标题
      title: "",
      // 商户树选项
      deptOptions: undefined,
      // 是否显示弹出层
      open: false,
      // 商户名称
      deptName: undefined,
      // 默认密码
      initPassword: undefined,
      // 日期范围
      dateRange: [],
      // 岗位选项
      postOptions: [],
      // 角色选项
      roleOptions: [],
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/user/importData"
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
      // 冻结/解冻用户
      status: {
        // 是否显示弹出层（冻结/解冻用户）
        open: false,
        // 弹出层标题（冻结/解冻用户）
        title: "",
        // 表单验证（冻结/解冻用户）
        rules: {
          status: [
            { required: true, message: "状态不能为空", trigger: "blur" },
          ],
        },
        // 表单参数（合并用户）
        form: {
          userId: undefined,
          status: undefined,
        },
      },
      userFlowMoney: {
        // 遮罩层
        loading: true,
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,

        user: {
          userId:undefined
        },
      },
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
      // 合并用户
      merge: {
        // 是否显示弹出层（合并用户）
        open: false,
        // 弹出层标题（合并用户）
        title: "",
        // 表单验证（合并用户）
        rules: {
          userId: [
            { required: true, message: "合并账号不能为空", trigger: "blur" },
          ],
          mergeUserId: [
            { required: true, message: "被合并账号不能为空", trigger: "blur" },
          ],
        },
        // 表单参数（合并用户）
        form: {
          userId: undefined,
          mergeUserId: undefined,
        },
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderByColumn:"userId",
        isAsc:"asc",
        userId: undefined,
        nickName: undefined,
        phonenumber: undefined,
        status: undefined,
        deptId: undefined,
        onlyChildAdminFlg: false,
        childAdminShowFlag: undefined
      },
      // 列信息
      columns: [
        { key: 0, label: `用户编号`, visible: true },
        { key: 1, label: `登录账号`, visible: true },
        { key: 2, label: `用户昵称`, visible: true },
        { key: 3, label: `商户`, visible: true },
        { key: 4, label: `手机号码`, visible: true },
        { key: 5, label: `状态`, visible: true },
        { key: 6, label: `创建时间`, visible: true }
      ],
      // 游戏收益列表
      gameWinMoneyColumns: [],
      userListOptions:[],
      // 表单校验
      rules: {
        userName: [
          { required: true, message: "登录账号不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '登录账号长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        password: [
          { required: true, message: "用户密码不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        email: [
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      },
      // 添加子账号
      addChildAdmin: {
        // 是否显示弹出层（添加子账号）
        open: false,
        // 弹出层标题（添加子账号）
        title: "",
        // 表单验证（添加子账号）
        rules: {
          userName: [
            { required: true, message: "登录账号不能为空", trigger: "blur" },
            { min: 2, max: 20, message: '登录账号长度必须介于 2 和 20 之间', trigger: 'blur' }
          ],
          nickName: [
            { required: true, message: "用户昵称不能为空", trigger: "blur" }
          ],
          password: [
            { required: true, message: "用户密码不能为空", trigger: "blur" },
            { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
          ],
        },
        // 表单参数（添加子账号）
        form: {
          userId: undefined,
          nickName: undefined,
          userName: undefined,
          password: undefined,
          isTest: undefined,
          status: undefined,
          roleIds: []
        },
      },
    };
  },
  watch: {
    // 根据名称筛选商户树
    deptName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getGameList();
    this.getList();
    this.getDeptTree();
    this.getConfigKey("sys.user.initPassword").then(response => {
      this.initPassword = response.msg;
    });
  },
  methods: {
    getGameList(){
      getValidGame().then(response => {
        this.gameWinMoneyColumns = response.gameList;
      });
    },
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      if(this.queryParams.onlyChildAdminFlg){
        this.queryParams.childAdminShowFlag = '1'
      }else{
        this.queryParams.childAdminShowFlag = undefined
      }
      listUser(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.userList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 查询商户下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },
    // 用户状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '""' + row.userName + '"用户吗？').then(function() {
        return changeUserStatus(row.userId, row.status);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
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
        userId: undefined,
        deptId: undefined,
        userName: undefined,
        nickName: undefined,
        password: undefined,
        phonenumber: undefined,
        email: undefined,
        amount:undefined,
        score:undefined,
        inviteCode:undefined,
        walletAddress:undefined,
        sex: undefined,
        realName: undefined,
        idcardNo: undefined,
        idcardFrontImg: undefined,
        idcardBackImg: undefined,
        isTest: "0",
        avatar: undefined,
        status: "0",
        userType: undefined,
        threeBallCommission: "100",
        fiveBallCommission: "100",
        tenBallCommission: "100",
        threeBallCashback: "100",
        fiveBallCashback: "100",
        tenBallCashback: "100",
        remark: undefined,
        postIds: [],
        roleIds: []
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.userId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    sortTableFun(data) {
      console.log('sortTableFun');
      const { prop, order } = data
      //排序列
      this.queryParams.orderByColumn=prop;
      //排序顺序ascending或descending
      this.queryParams.isAsc=order;
      //返回第一页
      this.queryParams.pageNum=1;
      this.getList();
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case "handleResetPwd":
          this.handleResetPwd(row);
          break;
        case "handleAuthRole":
          this.handleAuthRole(row);
          break;
        default:
          break;
      }
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.addChildAdmin.form = {
          userId: undefined,
          nickName: undefined,
          userName: undefined,
          password: undefined,
          isTest: "0",
          status: "0",
          deptId:100,
          roleIds:[]
      };

      this.addChildAdmin.open = true;
      this.addChildAdmin.title = "添加子账号";
      this.addChildAdmin.form.password = this.initPassword;
      this.addChildAdmin.form.roleIds.push(4);
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userId = row.userId || this.ids;
      getUser(userId).then(response => {
        this.form = response.data;
        this.postOptions = response.posts;
        this.roleOptions = response.roles;
        this.$set(this.form, "postIds", response.postIds);
        this.$set(this.form, "roleIds", response.roleIds);
        this.open = true;
        this.title = "修改用户";
        this.form.password = "";
      });
    },
    /** 重置密码按钮操作 */
    handleResetPwd(row) {
      this.$prompt('请输入"' + row.userName + '"的新密码', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        inputPattern: /^.{5,20}$/,
        inputErrorMessage: "用户密码长度必须介于 5 和 20 之间"
      }).then(({ value }) => {
        resetUserPwd(row.userId, value).then(response => {
          this.$modal.msgSuccess("修改成功，新密码是：" + value);
        });
      }).catch(() => {});
    },
    /** 重置支付密码按钮操作 */
    handleResetPayPwd(row) {
      this.$prompt('请输入"' + row.userName + '"的新支付密码', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        inputPattern: /^.{1,6}$/,
        inputErrorMessage: "用户密码长度必须介于 1 和 6 之间"
      }).then(({ value }) => {
        resetUserPayPwd(row.userId, value).then(response => {
          this.$modal.msgSuccess("修改成功，新密码是：" + value);
        });
      }).catch(() => {});
    },
    /** 修改用户备注名按钮操作 */
    handleUpdateRemarkName(row) {
      this.$prompt('请输入"' + row.userName + '"的备注名', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        // inputPattern: /^.{1,6}$/,
        // inputErrorMessage: "用户密码长度必须介于 1 和 6 之间"
      }).then(({ value }) => {
        resetUserRemarkName(row.userId, value).then(response => {
          this.getList();
          this.$modal.msgSuccess("修改成功");
        });
      }).catch(() => {});
    },
    /** 修改用户上级用户按钮操作 */
    handleUpdateParent(row) {
      this.$prompt('请输入要修改的上级用户ID', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnClickModal: false,
        inputPattern: /^.*[0-9].*$/,
        inputErrorMessage: '请输入上级用户ID'
      }).then(({ value }) => {
        if (row.userId == value) {
          this.$modal.msgError("不能设置自己作为上级");
        }else{
          resetUserParentUserId(row.userId, value).then(response => {
            this.getList();
            this.$modal.msgSuccess("修改成功");
          });
        }
      }).catch(() => {});
    },
    /** 分配角色操作 */
    handleAuthRole: function(row) {
      const userId = row.userId;
      this.$router.push("/system/user-auth/role/" + userId);
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.userId != undefined) {
            updateUser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addUser(this.form).then(response => {
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
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除用户编号为"' + userIds + '"的数据项？').then(function() {
        return delUser(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/user/export', {
        ...this.queryParams
      }, `user_${new Date().getTime()}.xlsx`)
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('system/user/importTemplate', {
      }, `user_template_${new Date().getTime()}.xlsx`)
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
    // 合并用户
    handleMergeUser(row){
      this.merge.form = {
        userId: undefined,
        mergeUserId: undefined,
      };
      this.getUserList(row);
    },
    getUserList(row){
      selectAllUser().then(response => {
        this.userListOptions = [];
        const menu = { userId: this.loginUserId, nickName: this.loginUserName, children: [] };
        menu.children = this.handleTree(response.rows, "userId", "parentUserId");
        this.userListOptions.push(menu);
        this.merge.title = "合并账号";
        this.merge.open = true;
        this.merge.form.userId = row.userId;
      });
    },
    /** 转换菜单数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.userId,
        label: node.nickName,
        children: node.children
      };
    },
    submitMergeUser(){
      var mergeForm = this.merge.form;
      this.$refs["mergeForm"].validate(valid => {
        if (valid) {
          this.$modal.confirm('是否确认合并用户的数据？（合并后不可取消）').then(function() {
            return mergeUser(mergeForm);
          }).then(() => {
            this.merge.open = false;
            this.getList();
            this.$modal.msgSuccess("合并成功");
          }).catch(() => {});
        }
      });
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
    // 冻结/解冻账号
    handleFreezeUser(row){
      this.status.form = {
        userId: undefined,
        status: undefined,
      };
      this.status.title = "冻结/解冻账号";
      this.status.open = true;
      this.status.form.userId = row.userId;
      this.status.form.status = row.status;
    },
    submitFreezeUserForm(){
      var freezeUserForm = this.status.form;
      let text = freezeUserForm.status === "0" ? "启用" : "封禁";
      this.$modal.confirm('确认要"' + text + '"用户吗？').then(function() {
        console.log('submitFreezeUserForm');
        return changeUserStatus(freezeUserForm.userId, freezeUserForm.status);
      }).then(() => {
        this.status.open = false;
        this.getList();
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
      });
    },
    showUserFlowDetailList(row){
      this.userFlowMoney.open = true;
      this.userFlowMoney.title = "流水详情";
      this.userFlowMoney.user = {};
      this.userFlowMoney.user.userId = row.userId;
    },
    showUserBetDetailList(row){
      this.userBet.open = true;
      this.userBet.title = "投注记录";
      this.userBet.user = {};
      this.userBet.user.userId = row.userId;
    },
    submitAddChildAdminForm(){
      var addChildAdmin = this.addChildAdmin.form;
      this.$refs["addChildAdminForm"].validate(valid => {
        if (valid) {
          addChildAdminUser(addChildAdmin).then(response => {
            this.$modal.msgSuccess("新增子账号成功");
            this.addChildAdmin.open = false;
            this.getList();
          });
        }
      });
    }
  }
};
</script>
