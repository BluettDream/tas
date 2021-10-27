<template>
  <div class="theader" v-loading="loading">
    <div class="logo">
      <div class="logoText">教学辅助系统</div>
    </div>
    <div class="content">
      <el-popover placement="bottom-start" :width="150" trigger="hover">
        <template #reference>
          <el-button type="success" plain
            >个人信息<i class="el-icon-user-solid"
          /></el-button>
        </template>
        <el-card class="box-card">
          <template #header>
            <div class="card-header">
              <span>{{ userInfo.visiableName }}</span>
              <el-button
                type="primary"
                icon="el-icon-edit"
                circle
                size="mini"
                @click="dialogFormVisible = true"
              />
            </div>
          </template>
          <div class="info">
            <div>角色:{{ userInfo.role }}</div>
            <div v-show="userInfo.roleNum == '' ? false : true">
              {{ userInfo.content }}:{{ userInfo.roleNum }}
            </div>
          </div>
        </el-card>
      </el-popover>
      <div>
        <el-button type="primary" plain @click="logOut">退出登录</el-button>
      </div>
    </div>
    <el-dialog title="用户修改" v-model="dialogFormVisible">
      <el-form :model="userDialogForm">
        <el-form-item v-show="false"><el-input v-model="userDialogForm.id"/></el-form-item>
        <div class="nameAndNum" v-if="userInfo.realName != ''">
          <el-form-item
            label="真实姓名:"
            :label-width="formLabelWidth"
            style="width: 220px"
          >
            <el-input
              v-model="userDialogForm.realName"
              autocomplete="off"
              disabled
              style="width: 100%"
            />
          </el-form-item>
          <el-form-item :label-width="20"
            >{{ userInfo.content }}:&nbsp;&nbsp;
            <el-input
              v-model="userDialogForm.roleNum"
              autocomplete="off"
              disabled
              style="width: 70%"
            />
          </el-form-item>
        </div>
        <el-form-item label="用户名(登录昵称):" :label-width="formLabelWidth">
          <el-input
            v-model="userDialogForm.name"
            autocomplete="off"
            style="width: 50%"
          />
        </el-form-item>
        <el-form-item label="登录密码:" :label-width="formLabelWidth">
          <el-input
            v-model="userDialogForm.password"
            autocomplete="off"
            style="width: 50%"
            type="password"
            :show-password="true"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogFormVisible = false;submitDialog()"
            >确 定</el-button
          >
        </span>
      </template>
    </el-dialog>
  </div>
</template>
<script>
import { modifyUser } from "../../api/modifyUser";
export default {
  name: "THeader",
  data() {
    return {
      userInfo: {
        visiableName: "",
        name: "",
        realName: "",
        password:"",
        role: "",
        roleNum: "",
        content: "",
      },
      token:"",
      loading:false,
      dialogFormVisible: false,
      formLabelWidth: 125,
      userDialogForm: {},
    };
  },
  watch:{
    dialogFormVisible(newValue){
      if(newValue){
        this.userDialogForm.id=this.token,
        this.userDialogForm.realName=this.userInfo.realName,
        this.userDialogForm.name=this.userInfo.name,
        this.userDialogForm.password=this.userInfo.password,
        this.userDialogForm.roleNum=this.userInfo.roleNum
      }
    }
  },
  methods: {
    submitDialog(){
      this.loading = true;
      delete this.userDialogForm.realName
      delete this.userDialogForm.roleNum
      modifyUser(JSON.stringify(this.userDialogForm)).then(res => {
        this.loading = false;
        if(res.data.code === 200 && res.data.status === "success"){
          localStorage.removeItem("user");
          this.$alert('请返回登录页面重新登录', '用户修改成功', {
          confirmButtonText: '确定',
          callback: (action) => {
            this.$router.push("/login");
            this.$message.info({message:"请重新输入用户名和密码"})
          },
        })
        }
      }).catch(err => {
        this.loading = false;
        console.log(err)
        this.$message.error({message:"系统出错,请联系管理员"})
      })
    },
    logOut() {
      localStorage.removeItem("token");
      if (document.cookie !== undefined || document.cookie !== "") {
        document.cookie =
          "realName=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/tas";
      }
      this.$router.push("/login");
    },
  },
  created: function () {
    let user = JSON.parse(localStorage.getItem("user"));
    this.token = localStorage.getItem("token");
    if (user != null) {
      if (user.realName != "") {
        this.userInfo.realName = user.realName;
      }
      this.userInfo.name = user.name;
      this.userInfo.visiableName =
        this.userInfo.realName != ""
          ? this.userInfo.realName
          : this.userInfo.name;
      this.userInfo.password = user.password;
      switch (user.role) {
        case "student":
          this.userInfo.role = "学生";
          this.userInfo.content = "学号";
          this.userInfo.roleNum = user.roleNum;
          break;
        case "teacher":
          this.userInfo.role = "教师";
          this.userInfo.content = "工号";
          this.userInfo.roleNum = user.roleNum;
          break;
        case "admin":
          this.userInfo.role = "管理员";
          break;
      }
    }
  },
};
</script>
<style scoped>
.theader {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
  /* background-color:#c7c8cb; */
  border-bottom: 1px solid grey;
}
.logoText {
  font-size: 22px;
  width: 145px;
}
.content {
  display: flex;
  flex-flow: row nowrap;
}
.card-header {
  font-size: 20px;
}
.info {
  display: flex;
  flex-flow: column nowrap;
  width: 150px;
}
.card-header > .el-button {
  position: absolute;
  left: 125px;
}
.nameAndNum {
  display: flex;
  flex-flow: row nowrap;
}
.dialog-footer{
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
}
</style>