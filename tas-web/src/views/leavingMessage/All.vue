<template>
  <div class="all">
    <leaving-message-data :isStartSearch="true" :isChangeData="false"/>
  </div>
</template>

<script>
import LeavingMessageData from "../../components/leavMessComp/LeavingMessageData"
export default {
  name: 'All',
  components: { LeavingMessageData }
}
</script>