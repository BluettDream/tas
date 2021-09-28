<template>
  <div class="login">
    <img src="..\assets\img\login-bg.jpg" alt="背景"/>
    <div class="main">
      <el-row align="middle">
        <div class="info">
          <h1>教学辅助系统</h1>
          <div>欢迎进入学生教学辅助系统</div>
        </div>
        <div>
          <div class="biaodan">
            <el-form
              v-show="registered"
              :model="userForm"
              :rules="rules"
              ref="userForm"
              label-width="100px"
              class="demo-ruleForm"
              style="width: 380px"
            >
              <el-form-item label="ID" prop="id">
                <el-input
                  v-model="userForm.id"
                  placeholder="请输入用户id"
                ></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password" style="width: 280px">
                <el-input
                  v-model="userForm.password"
                  type="password"
                  placeholder="请输入密码"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item label="角色" prop="role" style="width: 200px">
                <el-select v-model="userForm.role" placeholder="身份">
                  <el-option label="学生" value="student"></el-option>
                  <el-option label="教师" value="teacher"></el-option>
                  <el-option label="管理员" value="admin"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm('userForm')"
                  >登录</el-button
                >
                <el-button type="success" @click="register">注册</el-button>
                <el-button @click="resetForm('userForm')">重置</el-button>
              </el-form-item>
            </el-form>
            <t-register v-show="!registered" />
          </div>
        </div>
      </el-row>
    </div>
    <p>Design by <a href="mailto:tmh.1@qq.com">191互联2田梦豪</a></p>
  </div>
</template>
<script>
import TRegister from "../components/TRegister";
import axios from "axios";
export default {
  name: "Login",
  components: { TRegister },
  data() {
    return {
      userForm: {
        id: localStorage.getItem("token") || "",
        password: "",
        role: "",
      },
      registered: true,
      rules: {
        id: [{ required: true, message: "请输入id", trigger: "blur" }],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 3, message: "长度最少3个字符", trigger: "blur" },
        ],
        role: [
          { required: true, message: "请选择个人身份", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post("/api/login", this.userForm).then((res) => {
            if (res.data == "success") {
              sessionStorage.setItem("id",this.userForm.id);
              localStorage.setItem("token", this.userForm.id);
              this.userForm.name = res.headers.user.split(",")[0];
              this.userForm.roleNum = res.headers.user.split(",")[1];
              delete this.userForm.id;
              localStorage.setItem("user", JSON.stringify(this.userForm));
              this.$router.push("/index");
            } else {
              this.$notify.error({
                title: "登录失败",
                message: "请检查ID,密码,角色是否正确!",
              });
            }
          });
        } else {
          return false;
        }
      });
    },
    register() {
      this.registered = false;
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
  created: function () {
    let user = JSON.parse(localStorage.getItem("user"));
    if (user != null) {
      this.userForm.password = user.password;
      this.userForm.role = user.role;
    }
  },
};
</script>

<style scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
img {
  position: absolute;
  width: 100%;
  height: 100%;
  /* filter: blur(5px); */
  z-index: -1;
}
.main {
  display: flex;
  flex-flow: row wrap;
  margin-left: 15px;
  margin-right: 15px;
}
.info {
  display: flex;
  flex-flow: column wrap;
  justify-content: center;
  align-items: center;
  max-width: 50%;
  background-color: rgba(121, 106, 238, 0.9);
  color: white;
  box-sizing: border-box;
  height: 350px;
  width: 450px;
  border-radius: 15px 0 0 15px;
  padding-left: 0;
}
h1 {
  margin-left: 0;
  line-height: 1.1;
  font-size: 2.2em;
}
.login p {
  position: absolute;
  bottom: 20px;
  color: white;
  font-size: 20px;
}
.login p a {
  text-decoration: none;
  color: #29d9df;
}
.login p a:hover {
  color: #3b25e6;
}
.biaodan {
  background-color: white;
  height: 350px;
  width: 410px;
  display: flex;
  flex-flow: column nowrap;
  align-items: center;
  justify-content: center;
  border-radius: 0 15px 15px 0;
  padding: 0;
}
</style>