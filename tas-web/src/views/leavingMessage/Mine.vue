<template>
  <div class="mine">
    <leaving-message-data :isStartSearch="true" :isChangeData="true"/>
  </div>
</template>

<script>
import LeavingMessageData from "../../components/leavMessComp/LeavingMessageData"
export default {
  name: "Mine",
  components:{ LeavingMessageData }
};
</script>