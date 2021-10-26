<template>
  <div class="data">
    <!-- 搜索信息栏 -->
    <div class="searchControl" v-if="isStartSearch">
      <div class="left">
        <!-- 标题筛选 -->
        <el-select
          v-model="currentTitle"
          placeholder="留言标题筛选"
          @focus="getTitleList"
          @change="getDataByTitle"
          size="small"
          clearable
          style="width: 150px"
        >
          <el-option v-for="title in distinctTitle" :key="title" :value="title">
          </el-option>
        </el-select>
        <!-- 日期搜索 -->
        <el-date-picker
          v-model="date"
          type="daterange"
          range-separator="|"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          size="small"
          style="width: 250px"
          @change="getPageByDate"
        />
      </div>
      <div class="right">
        <!-- 选择搜索 -->
        <el-autocomplete
          v-model="inputSearch"
          :fetch-suggestions="querySearchAsync"
          placeholder="请输入内容"
          size="small"
          :debounce="100"
        >
          <template #prepend>
            <el-select
              v-model="choose"
              placeholder="请选择"
              style="width: 95px"
            >
              <el-option label="标题" value="title"></el-option>
              <el-option label="内容" value="content"></el-option>
            </el-select>
          </template>
          <template #append>
            <el-tooltip
              effect="dark"
              content="清空搜索后也要记得点我哦"
              placement="bottom-end"
              :disabled="disabled"
            >
              <el-button
                icon="el-icon-search"
                @click="
                  disabled = true;
                  dynamicSearch();
                "
              />
            </el-tooltip>
          </template>
        </el-autocomplete>
      </div>
    </div>
    <!-- 数据内容 -->
    <div style="width: 100%; margin-top: 5px; overflow: auto">
      <el-table
        ref="multipleTable"
        :data="records"
        tooltip-effect="dark"
        size="medium"
        @selection-change="handleSelectionChange"
        :border="true"
        v-loading="loading"
        :stripe="searchCondition.isAll"
      >
        <el-table-column type="selection" min-width="45" />
        <el-table-column prop="id" v-if="false" />
        <el-table-column prop="receiver" label="留言接收人" min-width="100" />
        <el-table-column
          prop="date"
          label="留言日期"
          min-width="160"
          sortable
        />
        <el-table-column
          prop="title"
          label="留言标题"
          width="120"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="content"
          label="留言内容"
          :show-overflow-tooltip="true"
          width="400"
        />
        <el-table-column
          label="操作"
          min-width="150"
          fixed="right"
          v-if="isChangeData"
        >
          <template #default="scope">
            <el-button size="small" @click="handleEdit(scope.$index, scope.row)"
              >编辑</el-button
            >
            <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </div>
    <!-- 数据修改 -->
    <el-dialog
      title="留言信息修改"
      v-model="dialogFormVisible"
      center
      v-if="isChangeData"
    >
      <el-form :model="dialogForm">
        <el-form-item label="id" v-model="dialogForm.id" v-if="false" />
        <el-form-item label="留言接收人" :label-width="formLabelWidth">
          <el-input v-model="dialogForm.receiver" autocomplete="off" />
        </el-form-item>
        <el-form-item label="留言标题" :label-width="formLabelWidth">
          <el-input v-model="dialogForm.title" autocomplete="off" />
        </el-form-item>
        <el-form-item label="留言内容" :label-width="formLabelWidth">
          <el-input
            v-model="dialogForm.content"
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
      <el-button
        type="danger"
        plain
        @click="deleteSelectAll"
        v-if="isChangeData"
        >删除所选</el-button
      >
      <div style="min-width:101px">
        共<el-tag type=""> {{ totalMessages }} </el-tag>条留言
      </div>
      <div style="min-width:182px">
        当前第<el-input-number
          v-model="searchCondition.currentPage"
          :controls="false"
          @change="pageChange"
          size="mini"
          :min="1"
          :max="totalPages"
          style="width: 53px"
        />页&nbsp;&nbsp;&nbsp;共{{ totalPages }}页
      </div>
      <!-- 翻页 -->
      <div style="min-width:340px">
        <el-button @click="toFirst">首页</el-button>
        <el-button @click="toBefore">上一页</el-button>
        <el-button @click="toAfter">下一页</el-button>
        <el-button @click="toEnd">末页</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import { lmCommon } from "../../commonJs/lm";
import { changeData, deleteData } from "../../api/leavingmessage";
export default {
  name: "LeavingMessageData",
  props: {
    isStartSearch: [Boolean],
    isChangeData: [Boolean],
  },
  mixins: [lmCommon],
  data() {
    return {
      date: "",
      inputSearch: "",
      choose: "",
      loading: false,
      distinctTitle: [],
      currentTitle: "",
      multipleSelection: [],
      dialogFormVisible: false,
      dialogForm: {},
      rawDialogData: {},
      formLabelWidth: "120px",
    };
  },
  watch: {
    dialogFormVisible(newVal) {
      //监听是否修改，如果点击修改无论取消还是确定都刷新数据
      newVal ? "" : this.pageChange(this.searchCondition.currentPage);
    },
  },
  methods: {
    handleEdit(index, row) {
      //将选中行的数据传递给dialogForm表单
      this.dialogFormVisible = true;
      this.dialogForm.id = row.id;
      this.dialogForm.receiver = row.receiver;
      this.dialogForm.title = row.title;
      this.dialogForm.content = row.content;
      this.rawDialogData.id = row.id;
      this.rawDialogData.receiver = row.receiver;
      this.rawDialogData.title = row.title;
      this.rawDialogData.content = row.content;
    },
    handleDelete(index, row) {
      //删除一行数据
      this.loading = true;
      deleteData(row.id).then((res) => {
        if (res.data == "success") {
          this.records.length != 1
            ? this.pageChange(this.searchCondition.currentPage)
            : this.pageChange(this.searchCondition.currentPage - 1);
          this.$message.success({ message: "删除成功" });
        } else {
          this.$message.error({ message: "删除失败" });
        }
      });
    },
    dialogSubmit() {
      //提交修改表单数据
      let diffData = this.compareForm(this.rawDialogData, this.dialogForm);
      if (diffData !== "") {
        diffData.id = this.dialogForm.id;
        diffData.receiver = this.dialogForm.receiver;
        changeData(JSON.stringify(diffData)).then((res) => {
          if (res.data == "success") {
            this.pageChange(this.searchCondition.currentPage);
            this.$message.success({ message: "修改成功" });
          } else {
            this.$message.error({ message: "修改失败" });
          }
        });
      } else {
        this.$message.warning({ message: "暂无修改" });
      }
    },
    handleSelectionChange(val) {
      //记录所选行
      this.multipleSelection = val;
    },
    deleteSelectAll() {
      //多选删除
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
          deleteData(
            JSON.stringify(messageId).replace("[", "").replace("]", "")
          ).then((res) => {
            if (res.data == "success") {
              this.pageChange(this.searchCondition.currentPage - 1);
              this.$message.success({ message: "删除成功" });
            } else {
              this.$message.error({ message: "删除失败" });
            }
          });
        })
        .catch(() => {
          this.$message.error({ message: "系统异常" });
        });
    },
    compareForm(rawData, newData) {
      //比较表单不同数据
      let diffData = "";
      for (let i in newData) {
        if (newData[i] !== rawData[i]) {
          if (diffData == "") diffData = {};
          diffData[i] = newData[i];
        }
      }
      return diffData;
    },
  },
};
</script>

<style scoped>
.data {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
}
.searchControl {
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-between;
}
.pageControl {
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-between;
}
</style>