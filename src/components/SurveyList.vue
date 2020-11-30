<template>
  <div class="hello">
    <h1>Survey List</h1>
    <table class="border-collapse border border-green-800 table-auto">
      <thead>
        <tr>
          <th>Title</th>
          <th>Publisher</th>
        </tr>
      </thead>
      <tbody v-if="data">
        <tr
          v-for="row in data.data"
          :key="row.id"
          @click="route"
        >
          <td>{{ row.title }}</td>
          <td>{{ row.publisher_name }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, computed } from 'vue'
import { useAxios } from '@vue-composable/axios'

export default defineComponent({
  name: 'SurveyList',
  setup () {
    const { data, loading, exec, status } = useAxios()

    onMounted(() => {
      exec({
        method: 'GET',
        url: 'http://localhost:3000/api/v1/' + 'surveys/'
      })
    })

    return {
      data: computed(() => data.value),
      loading,
      status
    }
  }
})
</script>
