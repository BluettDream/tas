<template>
  <div class="home">
    <div class="head">
      <div class="title">欢迎来到教学辅助系统</div>
    </div>
    <div class="foot">
      <score-chart :averageScore="aveScore" v-if="hasScore" />
    </div>
  </div>
</template>

<script>
import ScoreChart from "../components/homeComp/ScoreChart";
import { mapState } from "vuex";
import { getAverageScore } from "../api/achievement";

export default {
  name: "Home",
  components: { ScoreChart },
  data() {
    return {
      aveScore: 0,
      hasScore: false,
    };
  },
  computed: mapState(["user"]),
  created: function () {
    getAverageScore(this.user.roleNum, "").then((res) => {
      if (res.data.status === "success") {
        if (res.data.data !== null) {
          this.aveScore = res.data.data;
          this.hasScore = true;
        } else {
          this.hasScore = false;
        }
      } else {
        this.$message.warning({ message: "系统异常,请联系管理员" });
      }
    });
  },
};
</script>

<style scoped>
.home {
  width: 97%;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
}
.head {
  display: flex;
  flex-flow: row;
  justify-content: space-around;
}
.foot {
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