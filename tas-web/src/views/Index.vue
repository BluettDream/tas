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
          <div v-show="isIndex">欢迎来到教学辅助系统</div>
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
      isIndex: true,
    };
  },
  created: function () {
    if (this.$route.path != "/index") {
      console.log(this.$route);
    }
  },
};
</script>

<style scoped>
.el-aside {
  position: fixed;
}
.right {
  margin-top: 5px;
  margin-left: 210px;
}
</style>