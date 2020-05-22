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
                :style="{display: column.responsiveness_priority * 120 > width ? 'none' : ''}"
              >
                <span v-if="checkColumnHeaderVisibility(column)">{{column.label}}</span>
              </th>
            </tr>
          </thead>
          <draggable v-model="tab.rows" tag="tbody">
            <tr
              v-for="(row, row_index) in tab.rows"
              :key="`row-${row_index}`"
              :class="{'bg-secondary': checkFocusRow(row_index)}"
              @mouseover="handleMouseOver(row_index)"
              @mouseleave="handleMouseLeave()"
            >
              <td
                v-for="(column, index) in tab.columns"
                :key="`cell-${index}`"
                :style="{display: column.responsiveness_priority * 120 > width ? 'none' : ''}"
              >
                <div v-if="(column.field == 'action' && checkCellVisibility(column, row_index))">
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

                <span
                  v-if="column.field != 'action' && checkCellVisibility(column, row_index)"
                >{{row[column.field]}}</span>
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
      width: 1000,
      mouseOverRowIndex: -1
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
    },
    handleMouseOver(index) {
      this.mouseOverRowIndex = index;
    },
    handleMouseLeave() {
      this.mouseOverRowIndex = -1;
    },
    checkCellVisibility(column, row_index) {
      if (column.display == null) {
        return true;
      }
      if (this.checkFocusRow(row_index) == true) {
        return true;
      }
      if (column.display == "on-row-active") {
        if (this.mouseOverRowIndex == row_index) {
          return true;
        }
        return false;
      }

      return true;
    },
    checkColumnHeaderVisibility(column) {
      if (column.display == null) {
        return true;
      }

      if (column.display == "on-row-active") {
        if (this.mouseOverRowIndex > -1) {
          return true;
        }
        return false;
      }
      return true;
    }
  }
};
</script>
<style scoped>
table td {
  padding: 2px;
}
</style>