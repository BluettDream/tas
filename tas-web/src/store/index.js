import { createStore } from 'vuex'

export default createStore({
  state: {
    user:{
      name:"",
      realName:"",
      role:"",
      roleNum:"",
    }
  },
  getters:{
  },
  mutations: {
    userMutation(state){
      let person = JSON.parse(localStorage.getItem("user"));
      if(person != null){
        state.user.name = person.name;
        state.user.role = person.role;
        state.user.roleNum = person.roleNum;
      }
    }
  },
  actions: {
  },
  modules: {
  }
})
