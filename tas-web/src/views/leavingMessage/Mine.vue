<template>
  <div class="mine">
    <!-- 搜索信息栏 -->
    <div class="searchControl">
      <div class="left">
        <!-- 标题筛选 -->
        <el-select
          v-model="currentTitle"
          placeholder="留言标题筛选"
          @focus="getTitleList"
          @change="getDataByTitle"
          size="small"
          clearable
          style="width: 150px;"
        >
          <el-option
            v-for="title in distinctTitle"
            :key="title"
            :value="title"
          >
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
          style="width: 250px;"
          @change="getPageByDate"
        />
      </div>
      <div class="right">
        <!-- 选择搜索 -->
        <el-input
          placeholder="请输入内容"
          v-model="inputSearch"
          class="input-with-select"
          size="small"
        >
          <template #prepend>
            <el-select
              v-model="choose"
              placeholder="请选择"
              style="width: 95px"
            >
              <el-option label="用户" value="receiver"></el-option>
              <el-option label="标题" value="title"></el-option>
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
      :data="records"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
      :border="true"
      v-loading="loading"
    >
      <el-table-column type="selection" width="45" />
      <el-table-column prop="id" v-if="false"/>
      <el-table-column prop="receiver" label="留言接收人" width="120" />
      <el-table-column prop="date" label="留言日期" width="170" sortable />
      <el-table-column prop="title" label="留言标题" width="150" />
      <el-table-column prop="content" label="留言内容" min-width="250" />
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
        <el-form-item label="id" v-model="dialogForm.id" v-if="false"/>
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
          <el-button @click="dialogFormVisible = false;pageChange(searchCondition.currentPage)">取 消</el-button>
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
        共<el-tag type=""> {{ totalMessages }} </el-tag>条留言
      </div>
      <div>
        当前第<el-input-number
          v-model="searchCondition.currentPage"
          :controls="false"
          @change="pageChange"
          size="mini"
          :min="1"
          :max="totalPages"
          style="width: 53px;"
        />页&nbsp;&nbsp;&nbsp;共{{ totalPages }}页
      </div>
      <!-- 翻页 -->
      <div>
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
export default {
  name: "Mine",
  mixins:[lmCommon],
  data() {
    return {
      dialogFormVisible: false,
      dialogForm: {},
      formLabelWidth: "120px",
      date: "",
      inputSearch: "",
      choose: "",
      loading: false,
      distinctTitle: [],
      currentTitle: "",
      multipleSelection: [],
    };
  },
  methods: {
    handleEdit(index, row) {
      this.dialogFormVisible = true;
      this.dialogForm = row;
      console.log(this.dialogForm)
    },
    handleDelete(index, row) {
      this.loading = true;
      //获取页面
    },
    dialogSubmit() {
      this.pageChange(this.searchCondition.currentPage)
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
    
  }
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