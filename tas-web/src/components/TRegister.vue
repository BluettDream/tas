<template>
  <div class="register">
    <el-form
      :model="registerForm"
      :rules="rules"
      ref="registerForm"
      :inline="true"
      :hide-required-asterisk="true"
      :status-icon="true"
      label-position="left"
      size="medium"
    >
      <el-form-item label="身份标识号:" prop="roleNum" style="width: 52%">
        <el-input
          v-model.number="registerForm.roleNum"
          placeholder="请输入学/工号"
        />
      </el-form-item>
      <el-form-item label="角色" prop="role" style="width: 42%">
        <el-select v-model="registerForm.role" placeholder="请选择身份">
          <el-option label="学生" value="student" />
          <el-option label="教师" value="teacher" />
        </el-select>
      </el-form-item>
      <el-form-item label="用户名" prop="name" style="width: 45%">
        <el-input v-model="registerForm.name" placeholder="请输入用户名" />
      </el-form-item>
      <el-form-item label="姓名" prop="realName" style="width: 50%">
        <el-input
          v-model="registerForm.realName"
          placeholder="请输入真实姓名"
        />
      </el-form-item>
      <el-form-item
        label="部门"
        prop="department"
        v-show="registerForm.role == 'teacher' ? true : false"
      >
        <el-input
          v-model="registerForm.department"
          placeholder="请输入所在学院"
        />
      </el-form-item>
      <el-form-item
        label="班级"
        prop="stuClass"
        v-show="registerForm.role == 'student' ? true : false"
      >
        <el-input
          v-model="registerForm.stuClass"
          placeholder="请输入所在班级"
        />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          type="password"
          v-model="registerForm.password"
          autocomplete="off"
          placeholder="请输入密码(最少3位字符)"
          show-password
        />
      </el-form-item>
      <a @click="goLogin">返回登录页面</a>
      <div class="btn">
        <el-form-item>
          <el-button type="primary" @click="submitForm('registerForm')"
            >注册</el-button
          >
          <el-button @click="resetForm('registerForm')">重置</el-button>
        </el-form-item>
      </div>
    </el-form>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "TRegister",
  data() {
    var checkNumber = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("学/工号不能为空"));
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error("请输入数值"));
        } else {
          callback();
        }
      }, 100);
    };
    return {
      registerForm: {
        name: "",
        realName: "",
        roleNum: "",
        role: "",
        password: "",
        stuClass: "",
        department: "",
      },
      rules: {
        roleNum: [{ required: true, validator: checkNumber, trigger: "blur" }],
        name: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        realName: [
          { required: true, message: "请输入真实姓名", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 3, message: "密码最少3位", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post("/tas/register", this.registerForm).then((res) => {
            if (res.data == "success") {
              localStorage.setItem("token", res.headers.token);
              localStorage.setItem("user", JSON.stringify(this.registerForm));
              this.$emit("isView", "true");
              this.$message.success({
                message: "帐号注册成功!!!",
                center: true,
              });
            } else {
              this.$message.error({
                message: "帐号注册失败!!!",
                center: true,
              });
            }
          });
        } else {
          this.$message.warning({ message: "信息校验不通过,请按要求填写!!!" });
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    goLogin() {
      this.$emit("isView", "true");
    },
  },
};
</script>
<style scoped>
.register {
  padding-left: 10px;
}
.register a {
  text-decoration: none;
  color: #796aee;
}
.register a:hover {
  color: red;
  cursor: pointer;
}
.btn {
  display: flex;
  flex-flow: row;
  justify-content: space-around;
}
</style>