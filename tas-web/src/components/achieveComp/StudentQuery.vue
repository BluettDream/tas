<template>
  <div class="studentQuery">
    <div class="left" v-if="tableData.length > 0 ? true : false">
      <v-chart class="chart" :option="option" />
    </div>
    <div class="right">
      <div class="studentTable">
        <el-table :data="tableData" border style="width: 100%" :stripe="true">
          <el-table-column prop="id" label="ID" v-if="false" />
          <el-table-column
            prop="courseName"
            label="课程名称"
            min-width="200px"
          />
          <el-table-column prop="score" label="分数" :sortable="true" />
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { getScoreReport } from "../../api/achievement";
import { use } from "echarts/core";
import { CanvasRenderer } from "echarts/renderers";
import { PieChart } from "echarts/charts";
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
} from "echarts/components";
import VChart, { THEME_KEY } from "vue-echarts";

use([
  CanvasRenderer,
  PieChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent,
]);
export default {
  name: "StudentQuery",
  components: { VChart },
  provide: {
    [THEME_KEY]: "light",
  },
  data() {
    return {
      tableData: [
        {
          id: "",
          courseName: "",
          score: "",
        },
      ],
      option: {
        title: {
          text: "分数占比图",
          left: "center",
        },
        tooltip: {
          trigger: "item",
          formatter: "{b} : {c}分 ({d}%)",
        },
        legend: {
          orient: "vertical",
          left: "left",
          data: [],
        },
        series: [
          {
            name: "分数占比图",
            type: "pie",
            radius: "50%",
            center: ["50%", "60%"],
            data: [],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      },
    };
  },
  methods: {
    getAttrs(array, attr) {
      var arr = array.map((item) => {
        return item[attr];
      });
      return arr;
    },
  },
  computed: mapState(["user"]),
  created: function () {
    getScoreReport(this.user.roleNum, "").then((res) => {
      this.tableData = res.data;
      this.tableData.forEach((element) => {
        this.option.series[0].data.push({
          value: element.score,
          name: element.courseName,
        });
        this.option.legend.data.push(element.courseName);
      });
    });
  },
};
</script>

<style scoped>
.studentQuery {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-around;
  margin-top: 4%;
}
.chart {
  height: 300px;
  width: 500px;
}
</style>