<template>
  <div class="mine">
    <!-- 搜索信息栏 -->
    <div class="searchControl">
      <div class="left">
        <el-select
          v-model="value"
          placeholder="留言标题筛选"
          @focus="selectLMtitle"
          @change="selectLMByTitle"
          size="small"
          clearable
        >
          <el-option
            v-for="lMTitle in distinctLMTitle"
            :key="lMTitle"
            :value="lMTitle"
          >
          </el-option>
        </el-select>
        <el-date-picker
          v-model="value1"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          size="small"
        />
      </div>
      <div class="right">
        <el-input
          placeholder="请输入内容"
          v-model="input3"
          class="input-with-select"
          size="small"
        >
          <template #prepend>
            <el-select
              v-model="select"
              placeholder="请选择"
              style="width: 110px"
            >
              <el-option label="留言用户" value="1"></el-option>
              <el-option label="留言标题" value="2"></el-option>
            </el-select>
          </template>
          <template #append>
            <el-button icon="el-icon-search"></el-button>
          </template>
        </el-input>
      </div>
    </div>
    <!-- 数据内容 -->
    <el-table
      ref="multipleTable"
      :data="leavingMessage"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
      :border="true"
      v-loading="loading"
    >
      <el-table-column type="selection" width="45" />
      <el-table-column prop="id" label="id" v-if="false" />
      <el-table-column prop="lMPersonName" label="留言人" v-if="false" />
      <el-table-column prop="isDeleted" label="是否已经删除" v-if="false" />
      <el-table-column prop="receiver" label="接收留言用户" width="120" />
      <el-table-column prop="lMDate" label="留言日期" width="170" sortable />
      <el-table-column prop="lMTitle" label="留言标题" width="150" />
      <el-table-column prop="lMContent" label="留言内容" min-width="250" />
      <el-table-column label="操作" width="150" fixed="right">
        <template #default="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >编辑</el-button
          >
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <!-- 数据修改 -->
    <el-dialog title="留言信息修改" v-model="dialogFormVisible" center>
      <el-form :model="dialogForm">
        <el-form-item label="留言接收人" :label-width="formLabelWidth">
          <el-input v-model="dialogForm.receiver" autocomplete="off" />
        </el-form-item>
        <el-form-item label="留言标题" :label-width="formLabelWidth">
          <el-input v-model="dialogForm.lMTitle" autocomplete="off" />
        </el-form-item>
        <el-form-item label="留言内容" :label-width="formLabelWidth">
          <el-input
            v-model="dialogForm.lMContent"
            autocomplete="off"
            type="textarea"
            :autosize="{ minRows: 2, maxRows: 8 }"
            resize="none"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button
            type="primary"
            @click="
              dialogFormVisible = false;
              dialogSubmit();
            "
            >确 定</el-button
          >
        </span>
      </template>
    </el-dialog>
    <!-- 分页控制 -->
    <div class="pageControl">
      <el-button type="danger" plain @click="deleteSelectAll"
        >删除所选</el-button
      >
      <div>
        共<el-tag type=""> {{ pageInfo.totalMessages }} </el-tag>条留言
      </div>
      <div>
        当前第<el-input-number
          v-model="pageInfo.currentPage"
          :controls="false"
          @change="handleChange"
          size="mini"
          :min="1"
          :max="pageInfo.totalPages"
          style="width: 53px;"
        />页&nbsp;&nbsp;&nbsp;共{{ pageInfo.totalPages }}页
      </div>
      <div>
        <el-button @click="gotoIndex">首页</el-button>
        <el-button @click="gotoBefore">上一页</el-button>
        <el-button @click="gotoAfter">下一页</el-button>
        <el-button @click="gotoEnd">末页</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Mine",
  data() {
    return {
      dialogFormVisible: false,
      dialogForm: {},
      formLabelWidth: "120px",
      value1: "",
      value2: "",
      input3: "",
      select: "",
      defaultTime2: [
        new Date(2000, 1, 1, 12, 0, 0),
        new Date(2000, 2, 1, 8, 0, 0),
      ], // '12:00:00', '08:00:00'
      loading: false,
      value: "",
      userInfo: {
        name: "",
        role: "",
      },
      pageInfo: {
        currentPage: 1,
        totalMessages: 0,
        totalPages: 0,
      },
      leavingMessage: [],
      distinctLMTitle: [],
      currentTitle: null,
      multipleSelection: [],
    };
  },
  methods: {
    dialogSubmit() {
      //获取页面
    },
    selectLMByTitle(value) {
      this.currentTitle = value;
      //获取页面
    },
    selectLMtitle() {
      //获取页面
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    deleteSelectAll() {
      this.loading = true;
      let messageId = [];
      for (let i = 0; i < this.multipleSelection.length; ++i) {
        messageId[i] = this.multipleSelection[i].id;
      }
      this.$confirm(
        "此操作将一次性删除" + messageId.length + "条留言, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          center: true,
        }
      )
        .then(() => {
          //获取页面
        })
        .catch(() => {
          //获取页面
        });
    },
    handleEdit(index, row) {
      this.dialogFormVisible = true;
      this.dialogForm = row;
      this.dialogForm.lMDate = dayjs();
      this.handleChange(this.pageInfo.currentPage);
    },
    handleDelete(index, row) {
      this.loading = true;
      let messageId = [row.id];
      //获取页面
    },
    handleChange(value) {
      this.loading = true;
      if (this.currentTitle != null) {
        //获取页面
      } else {
        //获取页面
      }
    },
    gotoIndex() {
      this.loading = true;
      if (this.currentTitle != null) {
        //获取页面
      } else {
        //获取页面
      }
    },
    gotoBefore() {
      this.loading = true;
      if (this.currentTitle != null) {
        //获取页面
      } else {
        //获取页面
      }
    },
    gotoAfter() {
      this.loading = true;
      if (this.currentTitle != null) {
        //获取页面
      } else {
        //获取页面
      }
    },
    gotoEnd() {
      this.loading = true;
      if (this.currentTitle != null) {
        //获取页面
      } else {
        //获取页面
      }
    },
    updateData(rearData) {
      const data = rearData;
      this.pageInfo.totalMessages = data.total;
      this.pageInfo.currentPage = data.current;
      this.pageInfo.totalPages = Math.ceil(this.pageInfo.totalMessages / 5);
      this.leavingMessage = data.records;
      //格式化日期
      this.leavingMessage.forEach((element) => {
        element.lMDate = dayjs(element.lMDate).format("YYYY-MM-DD HH:mm:ss");
      });
      this.loading = false;
    },
  },
  created: function () {},
};
</script>

<style scoped>
.mine {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
}
.searchControl {
  display: flex;
  flex-flow: row;
  align-items: center;
  justify-content: space-between;
}
.pageControl{
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: space-between;
}
</style>