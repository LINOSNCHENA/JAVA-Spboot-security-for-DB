<template>
  <div class="red">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <nuxt-link class="navbar-brand" to="/">Navbar</nuxt-link>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <template v-if="!isAuthenticated">
              <li class="nav-item">
                <nuxt-link
                  class="nav-link active"
                  aria-current="page"
                  to="/auth/login"
                  >Login</nuxt-link
                >
              </li>
              <li class="nav-item">
                <nuxt-link
                  class="nav-link active"
                  aria-current="page"
                  to="/auth/register"
                  >Register</nuxt-link
                >
              </li>
            </template>
            <template v-else>
              <li class="nav-item" @click="logout">
                <nuxt-link class="nav-link active" aria-current="page" to="#"
                  >Logout</nuxt-link
                >
              </li>
              <li>
                <nuxt-link
                  class="nav-link active"
                  aria-current="page"
                  to="/profile"
                >
                  Profile
                </nuxt-link>
              </li>
              <li>
                <nuxt-link
                  class="nav-link active"
                  aria-current="page"
                  to="/users"
                >
                  Users
                </nuxt-link>
              </li>
            </template>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  methods: {
    async logout() {
      await this.$auth.logout();
    },
  },
  computed: {
    isAuthenticated() {
      return this.$store.getters.isAuthenticated;
    },
  },
};
</script>

<style>
.red {
  color: pink;
  background-color: orange;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;

  line-height: 1.3;
  font-size: 1.3rem;
  font-family: cursive, sans-serif;
  font-weight: bolder;
  font-style: italic;


  max-width: 85%;
  max-height: 85%;
}
</style>
