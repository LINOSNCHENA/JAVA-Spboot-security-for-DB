<template>
  <div class="red">
    <ul>
      <li v-for="(user, index) in users" :key="index">
        {{ user }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      users: [],
    };
  },
  computed: {
    getUserInfo() {
      return this.$store.getters.getUserInfo;
    },
  },
  mounted() {
    this.getUsers();
  },
  methods: {
    async getUsers() {
      try {
        const data = await this.$axios.$post("/api/auth/users");
        this.users = data.users;
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>

<style></style>

<style>
.red {
  color: yellow;
  background-color: #2ecc71;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;

  line-height: 1.3;
  font-size: 1.3rem;
  font-family: cursive, sans-serif;
  font-weight: bolder;
  font-style: italic;
}
</style>
