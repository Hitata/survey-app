<template>
  <div class="container mx-auto px-4">
    <SurveyList />
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import SurveyList from '@/components/SurveyList.vue'

export default defineComponent({
  name: 'Home',
  components: {
    SurveyList
  }
})
</script>
