<template>
  <div class="theader">
    <div class="logo">
      <div class="logoText">教学辅助系统</div>
    </div>
    <div class="content">
      <el-popover
        placement="bottom-start"
        :width="150"
        trigger="hover"
      >
        <template #reference>
          <el-button type="success" plain
            >个人信息<i class="el-icon-user-solid"
          /></el-button>
        </template>
        <el-card class="box-card">
          <template #header>
            <div class="card-header">
              <span>{{userInfo.name}}</span>
              <!-- 待实现 -->
              <el-button type="primary" icon="el-icon-edit" circle size="mini" v-if="false"/>
            </div>
          </template>
          <div class="info">
            <div>角色:{{userInfo.role}}</div>
            <div v-show="userInfo.roleNum == '' ? false:true">{{userInfo.content}}:{{userInfo.roleNum}}</div>
          </div>
        </el-card>
      </el-popover>
      <div>
        <el-button type="primary" plain @click="logOut">退出登录</el-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "THeader",
  data() {
    return {
      userInfo: {
        name: "",
        role: "",
        roleNum: "",
        content:""
      },
    };
  },
  methods: {
    logOut() {
      localStorage.removeItem("token");
      if(document.cookie !== undefined || document.cookie !== ""){
        document.cookie="realName=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/tas";
      }
      this.$router.push("/login");
    },
  },
  created: function () {
    let user = JSON.parse(localStorage.getItem("user"));
    if (user != null) {
      if(user.realName != ""){
        this.userInfo.name = user.realName;
      }else{
        this.userInfo.name = user.name;
      }
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
.card-header{
  font-size: 20px;
}
.info{
  display: flex;
  flex-flow: column nowrap;
  width: 150px;
}
.card-header>.el-button{
  position: absolute;
  left: 125px;
}
</style>