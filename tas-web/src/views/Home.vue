<template>
  <div class="home">
    <div class="head">
      <div class="title">欢迎来到教学辅助系统</div>
    </div>
    <div class="foot">
        <score-chart/>
    </div>
  </div>
</template>

<script>
import ScoreChart from '../components/homeComp/ScoreChart'
export default {
  name: "Home",
  components:{ScoreChart},
  data(){
    return {
    }
  },
  created:function(){
  }
};
</script>

<style scoped>
.home{
  width: 97%;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
}
.head{
  display: flex;
  flex-flow: row;
  justify-content: space-around;
}
.foot{
  display: flex;
  flex-flow: row;
  justify-content: center;
}
.title {
  margin: 0 auto;
  font-size: 50px;
  color: #409eff;
}
</style>