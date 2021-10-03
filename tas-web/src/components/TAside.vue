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
          <i class="el-icon-setting"></i>
          <span>学生信息管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="2-1">学生信息录入</el-menu-item>
          <el-menu-item index="2-2">学生信息查询</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="3">
        <template #title>
          <i class="el-icon-menu"></i>
          <span>专业课程管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="3-1">添加专业</el-menu-item>
          <el-menu-item index="3-2">查询专业</el-menu-item>
          <el-menu-item index="3-3">添加课程</el-menu-item>
          <el-menu-item index="3-4">查询课程</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="4">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>成绩信息管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="4-1">成绩信息录入</el-menu-item>
          <el-menu-item index="4-2">成绩信息查询</el-menu-item>
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
    };
  },
  methods: {},
};
</script>
<style scoped>
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