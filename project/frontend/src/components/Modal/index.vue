<template>
  <div>
    <button id="show-modal" @click="showModal = true">Show Modal</button>
      <!-- use the modal component, pass in the prop -->
      <modal v-if="showModal" @close="showModal = false">
        <div slot="body">
          <input v-model="username" type="text" class="input" placeholder="username">
          <input v-model="password" type="password" placeholder="password">
        </div>
        <button slot="footer" @click="login">
          Login
        </button>
        <h3 slot="header">LOGIN</h3>
      </modal>
  </div>
</template>

<script>
import modal from './modal'
import { login } from '@/api'
import axios from 'axios'

export default {
  data() {
    return {
      showModal: false,
      username: 'thaycacac',
      password: '123456'
    }
  },
  components: {
    modal
  },
  methods: {
    async login() {
      const dataFormat = `<UserDTO><username>${this.username}</username><password>${this.password}</password></UserDTO>`
      const hello = new DOMParser().parseFromString(dataFormat,"text/xml")
      const data = await login({ username: this.username, password: this.password })
      var config = {
 headers: {'Content-Type': 'text/xml'}
};
 axios.post('https://localhost:7985/api/user', hello, config).then(res => {
   console.log(res);
}).catch(err => console.log(err));
}
  }
}
</script>