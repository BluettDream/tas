<template>
  <div class="add">
    <el-form
      ref="scoreForm"
      :model="scoreForm"
      label-width="25%"
      :inline="true"
    >
      <el-form-item label="学生姓名">
        <el-input v-model="scoreForm.name" clearable />
      </el-form-item>
      <el-form-item label="学号">
        <el-input v-model="scoreForm.roleNum" clearable />
      </el-form-item>
      <el-form-item label="登录密码">
        <el-input v-model="scoreForm.password" clearable />
      </el-form-item>
      <div v-for="(item, index) in scoreForm.items" :key="item.key">
        <el-form-item label="课程" :prop="'items.' + index + '.course'">
          <el-select v-model="item.course" placeholder="请选择课程">
            <el-option
              v-for="course in courseList"
              :key="course" 
              :value="course"
              :label="course"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="成绩" :prop="'items.' + index + '.score'">
          <el-input v-model="item.score" />
        </el-form-item>
        <el-button @click="addItem" class="el-icon-plus" />
        <el-button
          @click.prevent="removeItem(item)"
          v-if="scoreForm.items.length !== 1"
          type="danger"
          >删除</el-button
        >
        <br />
      </div>
      <br />
      <el-form-item>
        <el-button type="primary" @click="onSubmit">录入成绩</el-button>
        <el-button @click="resetForm('scoreForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Add",
  data() {
    return {
      scoreForm: {
        name: "",
        roleNum: "",
        password: "",
        items: [
          {
            course: "",
            score: "",
          },
        ],
      },
      courseList:["语文","高数"]
    };
  },
  methods: {
    onSubmit() {
      console.log(this.scoreForm);
    },
    removeItem(item) {
      var index = this.scoreForm.items.indexOf(item);
      if (index !== -1) {
        this.scoreForm.items.splice(index, 1);
      }
    },
    addItem() {
      this.scoreForm.items.push({
        course: "",
        score: "",
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
  created:function(){
  }
};
</script>

<style>
</style>