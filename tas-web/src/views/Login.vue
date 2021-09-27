<template>
  <div class="login">
    <img src="..\assets\img\login-bg.jpg" />
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
            >
              <el-form-item label="用户名" prop="name">
                <el-input
                  v-model="userForm.name"
                  placeholder="请输入用户名"
                ></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password">
                <el-input
                  v-model="userForm.password"
                  type="password"
                  placeholder="请输入密码"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item label="身份" prop="role">
                <el-select v-model="userForm.role" placeholder="请选择个人身份">
                  <el-option label="学生" value="student"></el-option>
                  <el-option label="教师" value="teacher"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item
                label="学号"
                prop="id"
                v-show="userForm.role == 'student' ? true : false"
              >
                <el-input
                  v-model="userForm.id"
                  placeholder="请输入学号"
                ></el-input>
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
    <p>Design by <a href="#">191互联2田梦豪</a></p>
  </div>
</template>
<script>
import TRegister from "../components/TRegister";
export default {
  name: "login",
  components: { TRegister },
  data() {
    return {
      userForm: {
        id: "",
        name: "",
        password: "",
        role: "",
      },
      registered: true,
      rules: {
        name: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        password: [ 
          { required: true, message: "请输入密码", trigger: "blur" },
          {min: 3,message: "长度最少3个字符",trigger: "blur",},
        ],
        role: [
          { required: true, message: "请选择个人身份", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log("验证通过")
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
  }
};
</script>

<style>
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
  width: 450px;
  display: flex;
  flex-flow: column nowrap;
  align-items: center;
  justify-content: center;
  border-radius: 0 15px 15px 0;
}
.foreget {
  color: #85b4f2;
  font-size: 0.9em;
  text-decoration: none;
  cursor: pointer;
}
</style>