<template>
  <div class="query">
    <admin-query v-if="role == 'admin' ? true : false" />
    <student-query v-if="role == 'student' ? true : false" />
    <teacher-query v-if="role == 'teacher' ? true : false" />
  </div>
</template>

<script>
import AdminQuery from "../../components/achieveComp/AdminQuery";
import StudentQuery from "../../components/achieveComp/StudentQuery";
import TeacherQuery from "../../components/achieveComp/TeacherQuery";
import { mapState } from "vuex";
export default {
  name: "Query",
  components: { AdminQuery, StudentQuery, TeacherQuery },
  computed: mapState({
    role: state => state.user.role
  }),
};
</script>

<style scoped>
.query{
  min-width: 460px;
}
</style>