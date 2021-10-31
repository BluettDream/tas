<template>
  <div class="uploadAchievement">
    <div>
      使用Excel文件录入学生成绩单(注意:<mark>1、确保学生为您所教学生&nbsp;2、使用正确格式Excle文件模板</mark>)
    </div>
    <br />
    <div class="foot">
      <el-upload
        class="upload-demo"
        ref="upload"
        drag
        multiple
        :before-upload="beforeAvatarUpload"
        :show-file-list="true"
        :limit="1"
        :on-exceed="handleExceed"
        :auto-upload="false"
        action="/tas/achievement/uploadStudentScore"
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将Excel文件拖到此处，或<em>点击上传</em>
        </div>
        <template #tip>
          <div class="el-upload__tip">只能上传 xls/xlsx 文件，且不超过 5MB</div>
          <el-button type="success" class="sc">开始上传成绩单</el-button>
        </template>
      </el-upload>
      <div class="daochu">
        <div>点击下载录入成绩</div>
        <div>所需Excel模板</div>
        <div>已有模板不需要点击</div>
        <el-button type="primary" plain @click="downloadTemplate"
          >导出</el-button
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UploadAchievements",
  data(){
    return {
      isFirst:true
    }
  },
  methods: {
    beforeAvatarUpload(file) {
      console.log(file);
    },
    downloadTemplate() {
      console.log("开始下载");
    },
    handleExceed(files, fileList) {
      if(this.isFirst){
        this.$message.warning(
        `当前限制上传 1 个文件，您一共选择了 ${
          files.length + fileList.length
        } 个文件,超出文件上传限制`
      );
      }
      if(!this.isFirst)this.$message.info("请只上传一个文件");
      this.isFirst = false;
    },
  },
};
</script>

<style scoped>
.uploadAchievement {
  position: relative;
}
.foot {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-around;
  align-items: center;
}
.daochu {
  width: 170px;
  display: flex;
  flex-flow: column;
  justify-content: center;
  font-size: 17px;
}
.sc {
  position: absolute;
  bottom: -20px;
  right: -5px;
}
</style>