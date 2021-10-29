<template>
  <div class="achievement">
      <!-- 成绩显示页面 -->
      <router-view v-slot="{ Component }">
        <keep-alive exclude="Query">
          <component :is="Component" />
        </keep-alive>
      </router-view>
  </div>
</template>

<script>
export default {
    name: 'Achievement'
}
</script>

<style scoped>
.achievement{
  width: 100%;
  height: 100%;
}
</style>