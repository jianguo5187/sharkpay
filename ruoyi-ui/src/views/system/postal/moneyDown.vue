<template>
  <div class="app-container">
    <el-form :model="queryParams" :rules="rules"  ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-row :gutter="20">
        <el-form-item label="用户" prop="userId">
          <treeselect
            v-model="queryParams.userId"
            :options="userListOptions"
            :normalizer="normalizer"
            :show-count="true"
            placeholder="请选择用户"
            style="width: 320px;"/>
        </el-form-item>
      </el-row>

      <el-row :gutter="20">
        <el-form-item label="扣款金额" prop="cashMoney">
          <el-input
            v-model="queryParams.cashMoney"
            placeholder="请输入金额"
            clearable
          />
        </el-form-item>
      </el-row>

      <el-row :gutter="20">
        <el-form-item label="备注" prop="cashContent">
          <el-input v-model="queryParams.cashContent" placeholder="请输入备注"/>
        </el-form-item>
      </el-row>

      <el-form-item>
        <el-button type="success" icon="el-icon-edit" size="mini" @click="postal">保存</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {selectAllUser} from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {adminPostal} from "@/api/system/postal";

export default {
  name: "moneyDown",
  components: {Treeselect},
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        userId: null,
        cashMoney: null,
        cashContent: null,
      },
      // 表单参数
      form: {},
      userListOptions:[],
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户不能为空", trigger: "blur" },
        ],
        cashMoney: [
          { required: true, message: "金额不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{1,2})?$/,
            message: "请输入正确的金额",
            trigger: "blur"
          }
        ],
      }
    };
  },
  created() {
    this.getUserList();
  },
  methods: {
    getUserList(){
      selectAllUser().then(response => {
        this.userListOptions = [];
        const menu = { userId: this.loginUserId, nickName: this.loginUserName, children: [] };
        menu.children = this.handleTree(response.rows, "userId", "parentUserId");
        this.userListOptions.push(menu);
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
    postal(){
      this.$refs["queryForm"].validate(valid => {
        if(valid){
          adminPostal(this.queryParams).then(response => {
            this.$modal.msgSuccess("下分成功");
            this.queryParams.userId = null;
            this.queryParams.cashMoney = null;
            this.queryParams.cashContent = null;
          });
        }
      });
    },
  }
};
</script>
