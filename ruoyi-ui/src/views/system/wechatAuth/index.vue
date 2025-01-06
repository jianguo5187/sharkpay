<template>
  <div class="app-container">
    <div style="padding-bottom: 10px;">
      <span style="font-size: 20px;">
        域名设置规则:
      </span>
      <br>
      <span style="font-size: 15px;">
        输入的域名必须包含<span style="color: red;">http或者https</span>【例如：http://ping.abca.cn】
      </span>
      <br>
      <span style="font-size: 15px;color: red;">
        域名不要数字开头，否则微信扫一扫登录会被拦截
      </span>
    </div>
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      <el-form-item label="授权域名状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择授权域名状态" clearable>
          <el-option
            v-for="dict in dict.type.landing_domain_status"
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="wechatAuthList" @selection-change="handleSelectionChange">
      <el-table-column label="授权域名ID" align="center" prop="wechatAuthId" />
      <el-table-column label="授权域名" align="center" prop="wechatAuthUrl" />
      <el-table-column label="授权域名状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.landing_domain_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" width="100" prop="createBy" />
      <el-table-column label="创建时间" align="center" width="150" prop="createTime">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
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
            :disabled="total<=1"
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

    <!-- 添加或修改授权域名对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form @submit.native.prevent ref="form" :model="form" :rules="rules" label-width="108px">
        <el-form-item label="授权域名" prop="wechatAuthUrl">
          <el-input v-model="form.wechatAuthUrl" placeholder="请输入授权域名" @keyup.enter.native="submitForm"/>
        </el-form-item>
<!--        <el-form-item label="授权域名状态" prop="status">-->
<!--          <el-select v-model="form.status" placeholder="请选择授权域名状态">-->
<!--            <el-option-->
<!--              v-for="dict in dict.type.landing_domain_status"-->
<!--              :key="dict.value"-->
<!--              :label="dict.label"-->
<!--              :value="dict.value"-->
<!--            ></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->

        <el-form-item label="授权域名状态" prop="status" v-show="form.wechatAuthId != undefined && total>0">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.landing_domain_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
import { listWechatAuth, getWechatAuth, delWechatAuth, addWechatAuth, updateWechatAuth } from "@/api/system/wechatAuth";

export default {
  name: "WechatAuth",
  dicts: ['landing_domain_status'],
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
      // 授权域名表格数据
      wechatAuthList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        wechatAuthUrl: [
          { required: true, message: '请输入URL', trigger: 'blur' },
          // { validator: validateHttpOrHttps, trigger: 'blur' }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询授权域名列表 */
    getList() {
      this.loading = true;
      listWechatAuth(this.queryParams).then(response => {
        this.wechatAuthList = response.rows;
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
        wechatAuthId: null,
        wechatAuthUrl: null,
        status: "1",
        delFlag: null,
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
      this.ids = selection.map(item => item.wechatAuthId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加授权域名";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const wechatAuthId = row.wechatAuthId || this.ids
      getWechatAuth(wechatAuthId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改授权域名";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.wechatAuthId != null) {
            updateWechatAuth(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWechatAuth(this.form).then(response => {
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
      const wechatAuthIds = row.wechatAuthId || this.ids;
      this.$modal.confirm('是否确认删除授权域名编号为"' + wechatAuthIds + '"的数据项？').then(function() {
        return delWechatAuth(wechatAuthIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/wechatAuth/export', {
        ...this.queryParams
      }, `wechatAuth_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
