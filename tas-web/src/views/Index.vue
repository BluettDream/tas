<template>
  <div class="index">
    <div class="bgc"></div>
    <el-container>
      <el-aside >
        <!-- 侧边栏 -->
        <t-aside @collapse="getCollapse"/>
      </el-aside>
      <el-container class="right">
        <el-header>
          <!-- 头部 -->
          <t-header />
        </el-header>
        <el-main :class="[{zishiying:isMove},'start']">
          <!-- 主要内容 -->
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import TAside from "../components/commonComp/TAside";
import THeader from "../components/commonComp/THeader";
export default {
  name: "Index",
  components: { TAside, THeader },
  data(){
    return {
      isMove:false
    }
  },
  methods:{
    getCollapse(isCollapse){
      if(isCollapse){
        this.isMove = false;
      }else{
        this.isMove = true;
      }
    }
  },
  created:function(){

  }
};
</script>

<style scoped>
.index{
  height: 100%;
}
.bgc{
  background-image: url("../assets/img/wangzhan-bg.jpg");
  background-position: center;
  height: 100%;
  width: 100%;
  background-size: cover;
  position: fixed;
  z-index: -1;
}
.el-aside {
  position: fixed;
}
.el-container{
  height: 100%;
}
.el-header{
  margin-left: 210px;
  position: fixed;
  padding-top: 5px;
  width: 84%;
  background-color: transparent;
  z-index: 999;
}
.el-main{
  margin-top: 45px;
  height: 100%;
}
.start{
  margin-left: 210px;
}
.zishiying{
  margin-left: 80px !important;
}
</style>