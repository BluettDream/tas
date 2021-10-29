<template>
  <div class="taside" style="height: 100%">
    <div class="icon-wrap">
      <el-switch
        v-model="isCollapse"
        active-color="#409eff"
        inactive-color="#13ce66"
        active-text="展开"
        inactive-text="收起"
      />
    </div>
    <el-menu
      :default-active="$route.path"
      class="el-menu-vertical-demo"
      :collapse="!isCollapse"
      :unique-opened="true"
      :router="true"
    >
      <el-menu-item index="/home">首页</el-menu-item>
      <el-sub-menu index="1">
        <template #title>
          <i class="el-icon-s-promotion"></i>
          <span>留言管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/leavingMessage/mine"
            >我的留言</el-menu-item
          >
          <el-menu-item index="/leavingMessage/increase"
            >添加留言</el-menu-item
          >
          <el-menu-item index="/leavingMessage/all"
            >所有留言</el-menu-item
          >
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="2">
        <template #title>
          <i class="el-icon-s-data"></i>
          <span>成绩管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/achievement/add" v-if="role != 'student' ? true : false">成绩录入</el-menu-item>
          <el-menu-item index="/achievement/query">成绩查询</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
    </el-menu>
  </div>
</template>
<script>
export default {
  name: "TAside",
  data() {
    return {
      isCollapse: true,
      role: ""
    };
  },
  watch:{
    isCollapse(newValue){
      this.$emit("collapse",newValue);
    }
  },
  created:function(){
    let user = JSON.parse(localStorage.getItem("user"));
    if(user != null){
      this.role = user.role;
    }
  }
};
</script>
<style scoped>
.el-menu{
  background-color: transparent;
}
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
.icon-wrap {
  font-size: 50px;
  color: blue;
  width: 120px;
  margin-left: 20px;
}
</style>