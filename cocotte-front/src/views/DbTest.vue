<template>
  <div>
    <input type="file" @change="handleFileUpload">
    <button @click="uploadImage">Upload Image</button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data () {
    return {
      imageFile: null
    }
  },
  methods: {
    handleFileUpload (event) {
      this.imageFile = event.target.files[0]
    },
    async uploadImage () {
      const formData = new FormData()
      formData.append('image', this.imageFile)
      try {
        const response = await axios.post('http://localhost:3000/upload-image', formData)
        console.log(response.data)
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>
