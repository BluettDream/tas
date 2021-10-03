<template>
  <div class="add">
    <el-form ref="scoreForm" :model="scoreForm" label-width="80px">
      <el-form-item label="学生姓名">
        <el-input v-model="scoreForm.name" style="width: 20%"></el-input>
      </el-form-item>
      <el-form-item label="学号">
        <el-input v-model="scoreForm.roleNum" style="width: 20%"></el-input>
      </el-form-item>
      <el-form-item label="登录密码">
        <el-input v-model="scoreForm.password" style="width: 20%"></el-input>
      </el-form-item>
      <el-form-item label="课程" prop="course">
        <el-select v-model="scoreForm.course" placeholder="请选择课程名称">
          <el-option label="区域一" value="shanghai"></el-option>
          <el-option label="区域二" value="beijing"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="成绩">
        <el-input v-model="scoreForm.num" style="width: 20%"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">录入成绩</el-button>
        <el-button>重置</el-button>
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
        course: "",
        roleNum: "",
        password: "",
        num: "",
      },
    };
  },
  methods: {
    onSubmit() {
      console.log("submit!");
    },
  },
};
</script>

<style>
</style>