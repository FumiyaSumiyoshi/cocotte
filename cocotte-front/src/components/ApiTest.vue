<template>
  <div>
    <!-- ↓DB疎通確認用一時コメントアウト -->
    <!-- <h1>ApiTest</h1> -->
    <!-- <button @click="test">ApiTest</button>-->
    <!-- DB疎通確認用一時コメントアウト -->
    <!-- <button @click="dbTest">DbTest</button> -->
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data () {
    return {
      message: ''
    }
  },
  methods: {
    test () {
      fetch('http://localhost:3000/api/test')
        .then((response) => response.json())
        .then((data) => {
          this.message = data.message
        })
    }
  }
}

</script>
