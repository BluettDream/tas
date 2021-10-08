<template>
  <div>
    <el-form
      label-position="left"
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      class="demo-ruleForm"
    >
      <el-form-item label="留言标题" prop="title">
        <el-input
          v-model="ruleForm.title"
          style="width: 25%"
          placeholder="请输入留言标题"
        />
      </el-form-item>
      <el-form-item label="留言接收人" prop="receiver">
        <el-input
          v-model="ruleForm.receiver"
          style="width: 15%"
          placeholder="请输入接收人用户名"
        />
      </el-form-item>
      <el-form-item prop="date" label="留言发送时间" required>
        <el-date-picker
          v-model="ruleForm.date"
          type="datetime"
          placeholder="请选择日期和时间"
          style="width: 24%"
          :disabledDate="disabledDate"
        />
      </el-form-item>
      <el-form-item label="留言内容" prop="content">
        <el-input
          type="textarea"
          v-model="ruleForm.content"
          style="width: 60%"
          :autosize="{ minRows: 3, maxRows: 10 }"
          placeholder="请输入留言内容"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >创建留言</el-button
        >
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { addData } from "../../api/leavingmessage";
export default {
  name: "Increase",
  data() {
    return {
      ruleForm: {
        receiver: "",
        title: "",
        date: new Date(),
        content: "",
      },
      rules: {
        title: [{ required: true, message: "请输入标题", trigger: "blur" }],
        receiver: [
          { required: true, message: "请输入用户名", trigger: "blur" },
        ],
        content: [
          { required: true, message: "请填写留言内容", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    disabledDate(time) {
      return time.getTime() < Date.now() - 8.64e7; //如果没有后面的-8.64e7就是不可以选择今天的
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let sender = JSON.parse(localStorage.getItem("user")).name;
          this.ruleForm.sender = sender;
          addData(JSON.stringify(this.ruleForm)).then((res) => {
            if (res.data == "fail") {
              this.$message.warning({
                message: "留言接收人不存在,请检查用户名是否输入正确!!!",
              });
            } else if (res.data == "success") {
              this.$message.success({ message: "留言发送成功", center: true });
              this.resetForm("ruleForm");
            } else {
              this.$message.error({ message: "发送留言失败" });
            }
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style>
</style>