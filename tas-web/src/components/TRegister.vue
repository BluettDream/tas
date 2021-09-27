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
      <el-form-item label="学号" prop="id">
        <el-input
          v-model.number="registerForm.id"
          placeholder="请输入准确学号"
        ></el-input>
      </el-form-item>
      <el-form-item label="用户名" prop="name">
        <el-input
          v-model.number="registerForm.name"
          placeholder="请输入用户名"
        ></el-input>
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
      <el-form-item label="确认密码" prop="checkPass">
        <el-input
          type="password"
          v-model="registerForm.checkPass"
          autocomplete="off"
          placeholder="请再次输入密码"
          show-password
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('registerForm')">注册</el-button>
        <el-button @click="resetForm('registerForm')">重置</el-button>
      </el-form-item>
    </el-form>
    <a @click="goLogin">返回登录页面</a>
  </div>
</template>
<script>
export default {
  name: "TRegister",
  data() {
    var checkNumber = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("学号不能为空"));
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error("请输入数字值"));
        } else {
          if (value.toString().length != 10) {
            callback(new Error("学号输入长度不正确"));
          } else {
            callback();
          }
        }
      }, 1000);
    };
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registerForm.checkPass !== "") {
          this.$refs.registerForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      registerForm: {
        name: "",
        id: "",
        role: "student",
        password: "",
        checkPass: "",
      },
      rules: {
        password: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
        id: [{ validator: checkNumber, trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    goLogin(){
      this.$router.go("/login");
    }
  },
};
</script>
<style scoped>
.register a{
  text-decoration: none;
  color: #796aee;
  position: relative;
  left: 100px;
  top: -5px;
}
.register a:hover {
  color: red;
}
</style>