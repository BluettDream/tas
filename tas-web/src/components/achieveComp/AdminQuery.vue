<template>
    <div class="adminQuery">
    <div class="main">
      <div class="teacherTable" style="width: 100%;overflow:auto;">
        <el-table :data="tableData" border :stripe="true" v-loading="loading">
          <el-table-column prop="id" label="ID" v-if="false" />
          <el-table-column
            prop="courseName"
            label="课程名称"
            min-width="120"
          />
          <el-table-column prop="realName" label="学生姓名" min-width="80"/>
          <el-table-column prop="score" label="分数" :sortable="true" min-width="50"/>
          <el-table-column prop="studentClass" label="班级" min-width="100"/>
          <el-table-column label="操作" min-width="100" fixed="right">
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
import { mapState } from "vuex";
import { getScoreReport, changeScore } from "../../api/achievement";
export default {
    name: "AdminQuery",
    data(){
        return{
            tableData: [],
            loading:true
        }
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
              getScoreReport("", "").then((res) => {
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
    getScoreReport("", "").then((res) => {
      this.tableData = res.data;
      this.loading = false;
    });
  },
}
</script>

<style>

</style>