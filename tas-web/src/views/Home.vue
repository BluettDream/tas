<template>
  <div class="home">
    <div class="head">
      <div class="title">欢迎来到教学辅助系统</div>
    </div>
    <div class="foot" v-loading="loading">
      <message-chart :valueList="messageValueList" :maxValue="messageMaxValue" v-if="hasMessage" />
      <score-chart :averageScore="aveScore" v-if="hasScore" />
    </div>
  </div>
</template>

<script>
import ScoreChart from "../components/homeComp/ScoreChart";
import MessageChart from "../components/homeComp/MessageChart";
import { mapState } from "vuex";
import { getAverageScore } from "../api/achievement";
import { getMessageEveryMonth } from "../api/leavingmessage";
import axios from "axios";

export default {
  name: "Home",
  components: { ScoreChart, MessageChart },
  data() {
    return {
      aveScore: 0,
      hasScore: false,
      messageValueList: [],
      hasMessage: false,
      loading: true,
      messageMaxValue:100
    };
  },
  computed: mapState(["user"]),
  created: function () {
    axios
      .all([
        getAverageScore(this.user.roleNum, ""),
        getMessageEveryMonth(this.user.name),
      ])
      .then(
        axios.spread((scoreRes, messageRes) => {
          if (scoreRes.data.status === "success") {
            if (scoreRes.data.data !== null) {
              //分数可以查到则显示分数信息
              this.aveScore = scoreRes.data.data;
              this.hasScore = true;
            }
          } else {
            this.$message.warning({ message: "系统异常,请联系管理员" });
          }
          if (messageRes.data.status === "success") {
            this.messageValueList = messageRes.data.data;
            let mmax = Math.max.apply(null,this.messageValueList);
            this.messageMaxValue = mmax + Math.round(mmax/2);
            this.hasMessage = true;
          } else {
            this.$message.warning({ message: "系统异常,请联系管理员" });
          }
          if (this.hasMessage) {
            //如果留言信息获取成功，则显示留言信息
            this.loading = false;
          }
        })
      );
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
  margin-top: 5%;
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