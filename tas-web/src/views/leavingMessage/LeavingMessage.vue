<template>
  <div class="leavingMessage">
    <!-- 面包屑 -->
    <div class="bread">
      <el-breadcrumb separator-class="el-icon-document">
        <el-breadcrumb-item :to="{ path: '/leavingMessage/mine' }"
          >我的留言</el-breadcrumb-item
        >
        <el-breadcrumb-item :to="{ path: '/leavingMessage/all' }"
          >全部留言</el-breadcrumb-item
        >
        <el-breadcrumb-item :to="{ path: '/leavingMessage/increase' }"
          >添加留言</el-breadcrumb-item
        >
        <el-breadcrumb-item>191互联2田梦豪</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- 表格数据 -->
    <div>
      <router-view v-slot="{ Component }">
        <keep-alive exclude="Increase">
          <component :is="Component" />
        </keep-alive>
      </router-view>
    </div>
  </div>
</template>

<script>
export default {
  name: "LeavingMessage",
  data() {
    return {};
  },
  created: function () {},
};
</script>

<style scoped>
.bread{
  margin-bottom: 5px;
}
</style>