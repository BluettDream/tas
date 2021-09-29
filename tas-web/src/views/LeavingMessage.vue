<template>
  <div class="leavingMessage">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'LeavingMessage',
  data(){
    return{
      
    }
  },
  created:function(){
    console.log(this.$route);
    if (this.$route.path != "/index") {
      // console.log(this.$route);
    }
  }
}
</script>

<style scoped>
</style>