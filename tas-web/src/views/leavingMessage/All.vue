<template>
  <div class="all">
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
      height="350px"
      size="medium"
      style="width: 100%;margin-top:5px;"
      :border="true"
      v-loading="loading"
      :stripe="true"
    >
      <el-table-column prop="id" v-if="false" />
      <el-table-column prop="sender" label="留言发送人" width="100" />
      <el-table-column prop="receiver" label="留言接收人" width="100" />
      <el-table-column prop="date" label="留言日期" width="120" sortable />
      <el-table-column prop="title" label="留言标题" width="150" />
      <el-table-column prop="content" label="留言内容" min-width="250" />
    </el-table>
    <!-- 分页控制 -->
    <div class="pageControl">
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
          style="width: 53px"
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
  name: 'All',
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
    };
  },
  methods: {
  },
}
</script>

<style scoped>
.all {
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
.pageControl {
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: space-between;
}
</style>