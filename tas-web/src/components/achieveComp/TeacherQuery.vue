<template>
  <div class="tacherQuery">
    <div class="top">
      <v-chart class="chart" :option="option" />
    </div>
    <div class="bottom">
      <div class="teacherTable">
        <el-table :data="tableData" border style="width: 100%" :stripe="true">
          <el-table-column prop="id" label="ID" v-if="false"/>
          <el-table-column
            prop="courseName"
            label="课程名称"
            min-width="200px"
          />
          <el-table-column prop="realName" label="学生姓名"/>
          <el-table-column prop="score" label="分数" :sortable="true"/>
          <el-table-column label="操作">
              <el-button type="primary">修改</el-button>
          </el-table-column>
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
  name: "TeacherQuery",
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
  computed: mapState(["user"]),
  created: function () {
    getScoreReport("", this.user.roleNum).then((res) => {
      this.tableData = res.data;
      this.tableData.forEach(element => {
          this.option.series[0].data.push({value:element.score,name:element.courseName});
          this.option.legend.data.push(element.courseName)
      });
    });
  },
};
</script>

<style scoped>
.teacherQuery{
    display: flex;
    flex-flow: column nowrap;
    justify-content: center;
    width: 100%;
}
.top{
    display: flex;
    flex-flow: row nowrap;
    justify-content: center;
    align-items: center;
}
.chart {
  height: 300px;
  width: 500px;
}
</style>