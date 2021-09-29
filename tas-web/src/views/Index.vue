<template>
  <div class="index">
    <el-container>
      <el-aside style="width: 210px">
        <!-- 侧边栏 -->
        <t-aside />
      </el-aside>
      <el-container class="right">
        <el-header>
          <!-- 头部 -->
          <t-header />
        </el-header>
        <el-main>
          <!-- 主要内容 -->
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import TAside from "../components/TAside.vue";
import THeader from "../components/THeader.vue";
export default {
  name: "Index",
  components: { TAside, THeader },
  data() {
    return {
    };
  },
};
</script>

<style scoped>
.el-aside {
  position: fixed;
}
.right {
  margin-left: 210px;
}
.el-header{
  position: fixed;
  padding-top: 5px;
  width: 84%;
  background-color: #fff;
  z-index: 999;
}
.el-main{
  margin-top: 45px;
}
</style>