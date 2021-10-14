<template>
  <div class="tacherQuery">
    <div class="top" v-if="false">
      <v-chart class="chart" :option="option" />
    </div>
    <div class="bottom">
      <div class="teacherTable">
        <el-table :data="tableData" border style="width: 100%" :stripe="true" v-loading="loading">
          <el-table-column prop="id" label="ID" v-if="false" />
          <el-table-column
            prop="courseName"
            label="课程名称"
            min-width="200px"
          />
          <el-table-column prop="realName" label="学生姓名" />
          <el-table-column prop="score" label="分数" :sortable="true" />
          <el-table-column label="操作">
            <template #default="scope">
              <el-button
                size="small"
                @click="handleEdit(scope.$index, scope.row)"
                type="primary"
                icon="el-icon-edit"
                >修改</el-button
              ></template
            >
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
  <el-backtop />
</template>

<script>
import { use } from "echarts/core";
import { TooltipComponent } from "echarts/components";
import { GaugeChart } from "echarts/charts";
import { CanvasRenderer } from "echarts/renderers";
import VChart, { THEME_KEY } from "vue-echarts";

import { mapState } from "vuex";
import { getScoreReport, changeScore } from "../../api/achievement";

use([TooltipComponent, GaugeChart, CanvasRenderer]);
export default {
  name: "TeacherQuery",
  components: { VChart },
  provide: {
    [THEME_KEY]: "light",
  },
  data() {
    return {
      tableData: [],
      option: {
        title: {
          text: "班级平均分仪表盘",
        },
        tooltip: {
          formatter: "{a} <br/>{b} : {c}%",
        },
        series: [
          {
            name: "Pressure",
            type: "gauge",
            progress: {
              show: true,
            },
            detail: {
              valueAnimation: true,
              formatter: "{value}",
            },
            data: [
              {
                value: 50,
                name: "SCORE",
              },
            ],
          },
        ],
      },
      loading:true
    };
  },
  methods: {
    handleEdit(index, row) {
      this.$prompt(
        "<div>学生:" +
          row.realName +
          "</div><div>课程:" +
          row.courseName +
          "</div>",
        "修改分数",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          dangerouslyUseHTMLString: true,
        }
      )
        .then(({ value }) => {
          let score = {};
          score.id = row.id;
          score.num = value;
          changeScore(score).then((res) => {
            if (res.data == "success") {
              getScoreReport("", this.user.roleNum).then((res) => {
                this.tableData = res.data;
              });
              this.$message.success({
                message: "修改学生" + row.realName + "的成绩成功",
              });
            } else {
              this.$message.error({ message: "系统异常,修改失败!" });
            }
          });
        })
        .catch(() => {
          this.$message.info({ message: "取消成绩修改" });
        });
    },
  },
  computed: mapState(["user"]),
  created: function () {
    getScoreReport("", this.user.roleNum).then((res) => {
      this.tableData = res.data;
      this.loading = false;
    });
  },
};
</script>

<style scoped>
.teacherQuery {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  width: 100%;
}
.top {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
}
.chart {
  height: 300px;
  width: 50%;
}
</style>