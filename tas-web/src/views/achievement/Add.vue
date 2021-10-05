<template>
  <div class="add">
    <el-form
      ref="scoreForm"
      :model="scoreForm"
      label-width="25%"
      :inline="true"
    >
      <div
        v-for="(scoreInfo, index) in scoreForm.scoreInfomation"
        :key="scoreInfo"
      >
        <el-form-item label="学生姓名" :prop="'scoreInfomation.' + index + '.realName'" style="width: 17%" label-width="70px">
          <el-input
            v-model="scoreInfo.realName"
            clearable
            placeholder="请输入学生姓名"
          />
        </el-form-item>
        <el-form-item label="学号" :prop="'scoreInfomation.' + index + '.studentNumber'" style="width: 16%" label-width="50px">
          <el-input
            v-model="scoreInfo.studentNumber"
            clearable
            placeholder="请输入学生学号"
          />
        </el-form-item>
        <el-form-item
          label="课程"
          :prop="'scoreInfomation.' + index + '.course'"
          style="width: 25%"
          label-width="50px"
        >
          <el-select
            v-model="scoreInfo.course"
            placeholder="请选择课程"
            style="width: 100%"
          >
            <el-option
              v-for="course in courseList"
              :key="course"
              :value="course"
              :label="course"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label="成绩"
          :prop="'scoreInfomation.' + index + '.score'"
        >
          <el-input
            v-model="scoreInfo.score"
            clearable
            placeholder="请输入学生成绩"
          />
        </el-form-item>
        <el-button @click="addScoreInfo(index)" class="el-icon-plus" />
        <el-button @click="resetScoreInfo(index)" class="el-icon-delete" />
        <el-button
          @click.prevent="removeScoreInfo(scoreInfo)"
          v-if="scoreForm.scoreInfomation.length !== 1"
          type="danger"
          >删除</el-button
        >
        <br />
      </div>
      <br />
      <el-form-item>
        <div class="btn">
          <div>
            <el-button type="primary" @click="onSubmit">录入成绩</el-button>
            <el-button @click="resetForm">重置</el-button>
          </div>
          <div class="right">
            记住:&nbsp;&nbsp;&nbsp;&nbsp;
            <el-checkbox-group v-model="checkboxGroup" size="medium">
              <el-checkbox-button
                v-for="information in informations"
                :label="information"
                :key="information"
                >{{ information }}</el-checkbox-button
              >
            </el-checkbox-group>
          </div>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getCourse } from "../../api/achievement";
export default {
  name: "Add",
  data() {
    return {
      scoreForm: {
        scoreInfomation: [
          {
            realName: "",
            studentNumber: "",
            course: "",
            score: "",
          },
        ],
      },
      courseList: [],
      checkboxGroup: ["课程"],
      informations: ["学生姓名", "学号", "课程", "成绩"],
    };
  },
  methods: {
    onSubmit() {
      console.log(this.scoreForm);
    },
    updateRemeber() {
      console.log(value);
    },
    removeScoreInfo(scoreInfo) {
      var index = this.scoreForm.scoreInfomation.indexOf(scoreInfo);
      if (index !== -1) {
        this.scoreForm.scoreInfomation.splice(index, 1);
      }
    },
    addScoreInfo(index) {
      this.scoreForm.scoreInfomation.push({
        realName:
          this.checkboxGroup.indexOf("学生姓名") !== -1
            ? this.scoreForm.scoreInfomation[index].realName
            : "",
        studentNumber:
          this.checkboxGroup.indexOf("学号") !== -1
            ? this.scoreForm.scoreInfomation[index].studentNumber
            : "",
        course:
          this.checkboxGroup.indexOf("课程") !== -1
            ? this.scoreForm.scoreInfomation[index].course
            : "",
        score:
          this.checkboxGroup.indexOf("成绩") !== -1
            ? this.scoreForm.scoreInfomation[index].score
            : "",
      });
    },
    resetScoreInfo(index){
      let item = this.scoreForm.scoreInfomation[index];
      item.realName = "";
      item.studentNumber = "";
      item.course = "";
      item.score = "";
    },
    resetForm() {
      this.scoreForm.scoreInfomation.forEach(ele => {
        ele.realName = "";
        ele.studentNumber  = "";
        ele.course = "";
        ele.score = "";
      })
    },
  },
  created: function () {
    let user = JSON.parse(localStorage.getItem("user"));
    if (user != null) {
      getCourse(user.roleNum).then((res) => {
        this.courseList = res.data;
      });
    }
  },
};
</script>

<style scoped>
.el-form-item:last-child {
  margin-left: 6%;
  width: 80%;
}
.btn {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-around;
}
.right {
  display: flex;
  flex-flow: row nowrap;
}
</style>