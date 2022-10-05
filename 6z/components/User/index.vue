<template>
  <div class="user">
    Hello dear <b style="color: red">{{ getUserInfo.fullname }}</b> you're in
    profile page
    <hr />
    This is your information:
    <br /><br />
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">FullName</th>
          <th scope="col">Email</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{{ getUserInfo.id }}</td>
          <td>{{ getUserInfo.fullname }}</td>
          <td>{{ getUserInfo.email }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  computed: {
    getUserInfo() {
      return this.$store.getters.getUserInfo;
    },
  },
};
</script>

<style>
.user {
  color: rgb(207, 192, 255);
  background-color: khaki;
  border: solid 0.3em;
  border-color: red cyan ;
  
  max-width: 85%;
  max-height: 85%;
}
</style>


