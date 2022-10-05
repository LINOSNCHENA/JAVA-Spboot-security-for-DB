<template>
  <div class="defaultx">
    <layouts-header />
    <div class="container">
      <br />
      <Nuxt />
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
@import url("https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.2/js/bootstrap.min.js");

.defaultx {
  color: rgb(207, 192, 255);
  background-color: navy;
  border: solid 0.3em;
  border-color: red cyan ;
  
  max-width: 85%;
  max-height: 85%;
}
</style>