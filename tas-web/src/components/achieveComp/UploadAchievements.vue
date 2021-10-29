<template>
  <div class="uploadAchievement">
    <div>
      使用Excel文件录入学生成绩单(注意:<mark>1、确保学生为您所教学生&nbsp;2、使用正确格式Excle文件模板</mark>)
    </div>
    <br />
    <div class="foot">
      <el-upload
        class="upload-demo"
        drag
        action="http://localhost:8001/tas/"
        multiple
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :file-list="fileList"
        :auto-upload="false"
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将Excel文件拖到此处，或<em>点击上传</em>
        </div>
        <template #tip>
          <div class="el-upload__tip">只能上传 xls/xlsx 文件，且不超过 5MB</div>
        </template>
      </el-upload>
      <div class="daochu">
        <div>点击下载录入成绩</div>
        <div>所需Excel模板</div>
        <div>已有模板不需要点击</div>
        <el-button type="primary" plain>导出</el-button>
        <el-button type="success" class="sc">开始上传成绩</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UploadAchievements",
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