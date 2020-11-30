<template>
  <div class="container mx-auto px-4">
    <div v-if="data">
      {{ data }}
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed, watch, ref } from 'vue'
import { useAxios } from '@vue-composable/axios'

export default defineComponent({
  name: 'Home',
  components: {
  },
  setup () {
    const { data, loading, exec, status } = useAxios()
    // TODO: where to get route? inject from SetupContext?
    // const route = useRoute()

    // const id = computed(() => route.id)
    const id = ref(1)

    watch(id, id => {
      exec({
        method: 'GET',
        url: 'http://localhost:3000/api/v1/' + 'surveys/' + id
      })
    })

    return {
      id,
      data: computed(() => data.value),
      loading,
      status
    }
  }

})
</script>
