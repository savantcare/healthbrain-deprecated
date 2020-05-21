<template>
  <div>
    <vue-tabs>
      <v-tab v-for="(tab, index) in data" :key="`tab-${index}`" :title="tab.label">
        <table class="table">
          <thead class="thead">
            <tr>
              <th v-for="(column, index) in tab.columns" :key="`column-${index}`">{{column.label}}</th>
              <th>Action</th>
            </tr>
          </thead>
          <draggable v-model="tab.rows" tag="tbody">
            <tr
              v-for="(row, index) in tab.rows"
              :key="`row-${index}`"
              :class="{'bg-secondary': checkFocusRow(index)}"
            >
              <td
                v-for="(column, index) in tab.columns"
                :key="`cell-${index}`"
              >{{row[column.field]}}</td>
              <td>
                <b-button
                  size="sm"
                  variant="outline-primary"
                  v-b-tooltip.hover.bottom="'Change'"
                  v-if="tab.actions.indexOf('C') > -1"
                >C</b-button>
                <b-button
                  variant="outline-danger"
                  class="ml-2"
                  size="sm"
                  v-b-tooltip.hover.bottom="'Discontinue'"
                  v-if="tab.actions.indexOf('D') > -1"
                >D</b-button>
              </td>
            </tr>
          </draggable>
        </table>
      </v-tab>
    </vue-tabs>
  </div>
</template>

<script>
import draggable from "vuedraggable";
export default {
  props: ["data", "title", "type"],
  components: {
    draggable
  },
  computed: {
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
    }
  },
  methods: {
    checkFocusRow(index) {
      if (this.type == "card") {
        return this.focusRow == `${this.title}-${index + 1}`;
      }
      return false;
    }
  }
};
</script>
<style scoped>
@media only screen and (max-width: 500px) {
  table th:nth-child(3),
  table td:nth-child(3) {
    display: none;
  }
}
table td {
  padding: 2px;
}
</style>