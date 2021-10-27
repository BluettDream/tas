<template>
  <v-chart class="chart" :option="option" />
</template>

<script>
import { mapState } from "vuex";
import { getAverageScore } from "../../api/achievement";

import VChart from "vue-echarts";
import { use } from "echarts/core";
import { GaugeChart } from "echarts/charts";
import { SVGRenderer } from "echarts/renderers";

use([GaugeChart, SVGRenderer]);
export default {
  name: "ScoreChart",
  props: {
    averageScore:[Number],
  },
  components: { VChart },
  data() {
    return {
      option: {
        series: [
          {
            type: "gauge",
            startAngle: 180,
            endAngle: 0,
            min: 0,
            max: 1,
            splitNumber: 8,
            axisLine: {
              lineStyle: {
                width: 6,
                color: [
                  [0.25, "#FF6E76"],
                  [0.5, "#FDDD60"],
                  [0.75, "#58D9F9"],
                  [1, "#7CFFB2"],
                ],
              },
            },
            pointer: {
              icon: "path://M12.8,0.7l12,40.1H0.7L12.8,0.7z",
              length: "12%",
              width: 20,
              offsetCenter: [0, "-60%"],
              itemStyle: {
                color: "auto",
              },
            },
            axisTick: {
              length: 12,
              lineStyle: {
                color: "auto",
                width: 2,
              },
            },
            splitLine: {
              length: 20,
              lineStyle: {
                color: "auto",
                width: 5,
              },
            },
            axisLabel: {
              color: "#464646",
              fontSize: 20,
              distance: -60,
              formatter: function (value) {
                if (value === 0.875) {
                  return "A";
                } else if (value === 0.625) {
                  return "B";
                } else if (value === 0.375) {
                  return "C";
                } else if (value === 0.125) {
                  return "D";
                }
                return "";
              },
            },
            title: {
              offsetCenter: [0, "-40%"],
              fontSize: 20,
            },
            detail: {
              fontSize: 45,
              offsetCenter: [0, "-5%"],
              valueAnimation: true,
              formatter: function (value) {
                return value.toFixed(1) + "分";
              },
              color: "inherit",
            },
            data: [
              {
                value: 0,
                name: "平均分数",
              },
            ],
          },
        ],
      },
    };
  },
  computed: mapState(["user"]),
  created: function () {
    getAverageScore(this.user.roleNum, "").then((res) => {
      if(res.data.status === "success"){
        this.option.series[0].data[0].value = res.data.data;
      }else{
        this.$message.warning({message:"暂无分数"})
      }
    });
  },
};
</script>

<style scoped>
.chart {
  height: 400px;
  width: 400px;
}
</style>