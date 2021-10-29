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
        <el-form-item
          label="学生姓名"
          :prop="'scoreInfomation.' + index + '.realName'"
          style="width: 18%"
          label-width="70px"
        >
          <el-input
            v-model="scoreInfo.realName"
            clearable
            placeholder="请输入姓名"
          />
        </el-form-item>
        <el-form-item
          label="学号"
          :prop="'scoreInfomation.' + index + '.studentNum'"
          style="width: 16%"
          label-width="50px"
        >
          <el-input
            v-model="scoreInfo.studentNum"
            clearable
            placeholder="请输入学号"
          />
        </el-form-item>
        <el-form-item
          label="课程"
          :prop="'scoreInfomation.' + index + '.courseNum'"
          style="width: 25%"
          label-width="50px"
        >
          <el-select
            v-model="scoreInfo.courseNum"
            placeholder="请选择课程"
            style="width: 100%"
          >
            <el-option
              v-for="course in courseList"
              :key="course.num"
              :value="course.num"
              :label="course.name"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label="成绩"
          :prop="'scoreInfomation.' + index + '.num'"
          style="width: 17%"
          label-width="50px"
        >
          <el-input
            v-model="scoreInfo.num"
            clearable
            placeholder="请输入成绩"
          />
        </el-form-item>
        <el-tooltip
          effect="light"
          content="根据记住选项添加新数据"
          placement="bottom"
          :disabled="disabledAdd"
        >
          <el-button
            @click="
              addScoreInfo(index);
              disabledAdd = true;
            "
            class="el-icon-plus"
          />
        </el-tooltip>
        <el-tooltip
          effect="light"
          content="清空当前行所有数据"
          placement="bottom"
          :disabled="disabledDelete"
        >
          <el-button
            @click="
              resetScoreInfo(index);
              disabledDelete = true;
            "
            class="el-icon-delete"
          />
        </el-tooltip>
        <el-tooltip
          effect="light"
          content="移除当前行"
          placement="bottom"
          :disabled="disabledRemove"
          v-if="scoreForm.scoreInfomation.length !== 1"
        >
          <el-button
            @click.prevent="
              removeScoreInfo(scoreInfo);
              disabledRemove = true;
            "
            type="danger"
            >删除</el-button
          >
        </el-tooltip>
        <br />
      </div>
      <br />
      <el-form-item>
        <div class="btn">
          <div>
            <el-button type="primary" @click="dialogUploadVisible = true"
              >上传文件</el-button
            >
            <el-button type="primary" @click="onSubmit">录入成绩</el-button>
            <el-tooltip
              effect="light"
              content="清空当前页所有数据"
              placement="bottom"
              :disabled="disabledRemoveAll"
            >
              <el-button
                @click="
                  resetForm;
                  disabledRemoveAll = true;
                "
                >重置</el-button
              >
            </el-tooltip>
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
    <el-dialog title="Excel上传成绩单" v-model="dialogUploadVisible">
      <upload-achievements/>
    </el-dialog>
  </div>
</template>

<script>
import { getCourse, postAchievement } from "../../api/achievement";
import UploadAchievements from '../../components/achieveComp/UploadAchievements';
export default {
  components: { UploadAchievements },
  name: "Add",
  data() {
    return {
      scoreForm: {
        scoreInfomation: [
          {
            realName: "",
            studentNum: "",
            courseNum: "",
            num: "",
          },
        ],
      },
      courseList: [],
      checkboxGroup: ["课程"],
      informations: ["学生姓名", "学号", "课程", "成绩"],
      disabledAdd: false,
      disabledDelete: false,
      disabledRemove: false,
      disabledRemoveAll: false,
      dialogUploadVisible: false,
    };
  },
  methods: {
    onSubmit() {
      postAchievement(JSON.stringify(this.scoreForm.scoreInfomation))
        .then((res) => {
          if (res.data == "success") {
            this.$message.success({ message: "成绩录入成功" });
            this.resetForm();
          } else if (res.data == "fail") {
            this.$message.warning({
              message: "已有成绩录入,请检查录入数据是否重复",
            });
          } else {
            this.$message.warning({ message: "非法操作,成绩录入异常" });
          }
        })
        .catch((error) => {
          this.$message.error({ message: "系统异常,成绩录入失败" });
        });
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
        studentNum:
          this.checkboxGroup.indexOf("学号") !== -1
            ? this.scoreForm.scoreInfomation[index].studentNum
            : "",
        courseNum:
          this.checkboxGroup.indexOf("课程") !== -1
            ? this.scoreForm.scoreInfomation[index].courseNum
            : "",
        num:
          this.checkboxGroup.indexOf("成绩") !== -1
            ? this.scoreForm.scoreInfomation[index].num
            : "",
      });
    },
    resetScoreInfo(index) {
      let item = this.scoreForm.scoreInfomation[index];
      item.realName = "";
      item.studentNum = "";
      item.courseNum = "";
      item.num = "";
    },
    resetForm() {
      this.scoreForm.scoreInfomation.forEach((ele) => {
        ele.realName = "";
        ele.studentNum = "";
        ele.courseNum = "";
        ele.num = "";
      });
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