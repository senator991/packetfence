<template>
  <b-card no-body>
    <b-card-header>
      <h4 class="mb-3" v-t="'Filter Engines'"></h4>
      <p class="mb-0" v-t="'This is an advanced section. Proceed with caution when editing.'"></p>
    </b-card-header>
    <b-tabs ref="tabs" v-model="tabIndex">
      <b-tab v-for="filter in sortedFilters" :key="filter" :title="$t('{filter} filters', { filter: capitalize(filter) })" class="h-100 mb-3" @click="changeTab(filter)">
        <filter-engine-view
          :storeName="storeName"
          :id="filter"
          :ref="filter"
        />
      </b-tab>
    </b-tabs>
  </b-card>
</template>

<script>
import FilterEngineView from './FilterEngineView'

export default {
  name: 'FilterEngineTabs',
  components: {
    FilterEngineView
  },
  props: {
    tab: {
      type: String,
      default: null
    },
    storeName: { // from router
      type: String,
      default: null,
      required: true
    }
  },
  data () {
    return {
      filters: []
    }
  },
  computed: {
    tabIndex () {
      return this.filters.indexOf(this.tab)
    },
    sortedFilters () {
      let filters = this.filters
      return filters.sort()
    }
  },
  methods: {
    init () {
      this.$store.dispatch(`${this.storeName}/all`).then(filters => {
        this.filters = filters.map(filter => { return filter.id })
      })
    },
    changeTab (id) {
      this.$nextTick(() => {
        this.$refs[id][0].resizeEditor() // editors in other tabs have no clientHeight until after focused
      })
    },
    capitalize (filter) {
      return `${filter.charAt(0).toUpperCase()}${filter.slice(1)}`
    }
  },
  created () {
    this.init()
  }
}
</script>
