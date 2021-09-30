<template>
  <div class="register">
    <el-form
      :model="registerForm"
      status-icon
      :rules="rules"
      ref="registerForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <el-form-item label="身份标识号" prop="roleNum">
        <el-input
          v-model.number="registerForm.roleNum"
          placeholder="请输入学号或工号"
        ></el-input>
      </el-form-item>
      <el-form-item label="用户名" prop="name">
        <el-input
          v-model.number="registerForm.name"
          placeholder="请输入用户名"
        ></el-input>
      </el-form-item>
      <el-form-item label="角色" prop="role">
        <el-select v-model="registerForm.role" placeholder="请选择个人身份">
          <el-option label="学生" value="student"></el-option>
          <el-option label="教师" value="teacher"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          type="password"
          v-model="registerForm.password"
          autocomplete="off"
          placeholder="请输入密码(最少3位字符)"
          show-password
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('registerForm')"
          >注册</el-button
        >
        <el-button @click="resetForm('registerForm')">重置</el-button>
      </el-form-item>
    </el-form>
    <a @click="goLogin">返回登录页面</a>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "TRegister",
  data() {
    var checkNumber = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("标识号不能为空"));
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error("请输入数值"));
        } else {
          callback();
        }
      }, 300);
    };
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (value.length < 3) {
          callback(new Error("密码最少3位"));
        }
        callback();
      }
    };
    return {
      registerForm: {
        name: "",
        roleNum: "",
        role: "",
        password: "",
      },
      rules: {
        roleNum: [{ required: true, validator: checkNumber, trigger: "blur" }],
        name: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        password: [
          { required: true, validator: validatePass, trigger: "blur" },
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
              localStorage.setItem("token",res.headers.token);
              localStorage.setItem("user",JSON.stringify(this.registerForm));
              this.$router.go("/login");
            }
          });
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    goLogin() {
      this.$router.go("/login");
    },
  },
};
</script>
<style scoped>
.register a {
  text-decoration: none;
  color: #796aee;
  position: relative;
  left: 100px;
  top: -5px;
}
.register a:hover {
  color: red;
  cursor: pointer;
}
</style>