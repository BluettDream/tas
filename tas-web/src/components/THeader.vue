<template>
  <div class="theader">
    <div class="logo">
      <div class="logoText">教学辅助系统</div>
    </div>
    <div class="content">
      <el-popover
        placement="bottom-start"
        :title="`用户名：${userInfo.name}`"
        :width="150"
        trigger="hover"
        :content="`角色：${userInfo.role}`"
      >
        <template #reference>
          <el-button type="success" plain>个人信息<i class="el-icon-user-solid"/></el-button>
        </template>
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
      },
    };
  },
  methods: {
    logOut() {
      localStorage.removeItem("token");
      this.$router.push("/login")
    },
  },
  created: function () {
    let user = JSON.parse(localStorage.getItem("user"));
    if (user != null) {
      this.userInfo.name = user.name;
      switch(user.role){
        case 'student':
          this.userInfo.role = '学生'
          break;
        case 'teacher':
          this.userInfo.role = '教师'
          break;
        case 'admin':
          this.userInfo.role = '管理员'
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
.content{
  display: flex;
  flex-flow: row nowrap;
}
</style>