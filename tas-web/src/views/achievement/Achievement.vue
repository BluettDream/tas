<template>
  <div class="achievement">
      <!-- 成绩操作页面 -->
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

</style>