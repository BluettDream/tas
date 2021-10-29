<template>
  <v-chart class="chart" :option="option" />
</template>

<script>
import VChart from "vue-echarts";
import { use } from "echarts/core";
import {
  TitleComponent,
  TooltipComponent,
  GridComponent,
  VisualMapComponent,
} from "echarts/components";
import { LineChart } from "echarts/charts";
import { UniversalTransition } from "echarts/features";
import { SVGRenderer } from "echarts/renderers";

use([
  SVGRenderer,
  TitleComponent,
  TooltipComponent,
  GridComponent,
  VisualMapComponent,
  LineChart,
  UniversalTransition,
]);
export default {
  name: "MessageChart",
  props: {
    valueList: Array,
    maxValue: Number,
  },
  components: { VChart },
  data() {
    return {
      option: {
        visualMap: [
          {
            show: false,
            type: "continuous",
            seriesIndex: 0,
            min: 0,
            max: this.maxValue,
          },
        ],
        title: [
          {
            left: "center",
            text: "本年接收留言数据",
          },
        ],
        tooltip: {
          trigger: "axis",
          formatter: function (params) {
            let value = params[0].value != undefined ? params[0].value : 0;
            if(value == 0){
              return params[0].name+":<br>接收"+value+"条留言";
            }
            return params[0].marker+params[0].name+":<br>接收"+value+"条留言";
          },
        },
        xAxis: [
          {
            data: [
              "1月",
              "2月",
              "3月",
              "4月",
              "5月",
              "6月",
              "7月",
              "8月",
              "9月",
              "10月",
              "11月",
              "12月",
            ],
            axisLabel: {
              interval: 0, //0：全部显示，1：间隔为1显示对应类目，2：依次类推，（简单试一下就明白了，这样说是不是有点抽象）
              // rotate: -20 //倾斜显示，-：顺时针旋转，+或不写：逆时针旋转
            },
          },
        ],
        yAxis: [{}],
        grid: [
          {
            bottom: "35%",
          },
        ],
        series: [
          {
            type: "line",
            showSymbol: true,
            connectNulls: true,
            data: this.valueList,
          },
        ],
      },
    };
  },
};
</script>

<style scoped>
.chart {
  width: 500px;
  height: 400px;
}
</style>