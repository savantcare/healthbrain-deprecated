<template>
  <div v-elresize @elresize="handleResize">
    <vue-tabs>
      <v-tab v-for="(tab, index) in data" :key="`tab-${index}`" :title="tab.label">
        <table class="table">
          <thead class="thead">
            <tr>
              <th
                v-for="(column, index) in tab.columns"
                :key="`column-${index}`"
                :style="{display: column.priority * 120 > width ? 'none' : ''}"
              >{{column.label}}</th>
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
                :style="{display: column.priority * 120 > width ? 'none' : ''}"
              >
                <div v-if="column.field == 'action'">
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
                </div>
                <span v-else>{{row[column.field]}}</span>
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
  data() {
    return {
      width: 1000
    };
  },
  computed: {
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
    }
  },
  mounted() {},
  methods: {
    checkFocusRow(index) {
      if (this.type == "card") {
        return this.focusRow == `${this.title}-${index + 1}`;
      }
      return false;
    },
    handleResize(data) {
      this.width = data.target.clientWidth;
    }
  }
};
</script>
<style scoped>
table td {
  padding: 2px;
}
</style>