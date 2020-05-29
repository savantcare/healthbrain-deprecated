<template>
  <div v-elresize @elresize="handleResize">
    <el-tabs type="card">
      <el-tab-pane v-for="(tab, index) in tabData" :key="`tab-${index}`" :label="tab.label">
        <el-popover placement="bottom" width="200" trigger="click">
          <el-select
            v-model="selectedColumn"
            size="mini"
            clearable
            multiple
            placeholder="Select"
            collapse-tags
          >
            <el-option
              v-for="item in tab.columns"
              :key="item.field"
              :label="item.label"
              :value="item.field"
            ></el-option>
          </el-select>
          <i slot="reference" class="el-icon-s-tools settingsIcon"></i>
        </el-popover>
        <el-table-draggable>
          <el-table
            ref="dataTable"
            :data="tab.tableData"
            @selection-change="handleSelectionChange"
            @cell-mouse-enter="handleCellMouseEnter"
            @cell-mouse-leave="handleCellMouseLeave"
            size="mini"
          >
            <el-table-column type="expand" v-if="isExpandable">
              <!-- <template slot-scope="props"> -->
              <template>
                <!-- <p
                  v-for="(column, index_expand_row) in tab.columns"
                  :key="`tab-expand-row-${index_expand_row}`"
                >{{column.label}}: {{props.row[column.field]}}</p>-->
                <div>
                  <el-button
                    size="mini"
                    v-if="tab.rowActions.indexOf('C') > -1"
                    @click="handleEdit(scope.$index, scope.row)"
                  >Edit</el-button>
                  <el-button
                    size="mini"
                    type="danger"
                    v-if="tab.rowActions.indexOf('D') > -1"
                    @click="handleDelete(scope.$index, scope.row)"
                  >Discontinue</el-button>
                </div>
              </template>
            </el-table-column>
            <el-table-column type="selection"></el-table-column>

            <el-table-column
              v-for="(column, index_column) in getSelectedColumns(selectedColumn, tab.columns)"
              :key="`tab-${index}-column-${index_column}`"
              :label="column.label "
              :property="column.field"
              :sortable="column.sortable"
            ></el-table-column>
            <el-table-column>
              <template slot-scope="scope" v-if="scope.row.id == mouseOverRowId">
                <el-button
                  size="mini"
                  icon="el-icon-edit"
                  circle
                  v-if="tab.rowActions.indexOf('C') > -1"
                  @click="handleEdit(scope.$index, scope.row)"
                ></el-button>
                <el-button
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  circle
                  v-if="tab.rowActions.indexOf('D') > -1"
                  @click="handleDelete(scope.$index, scope.row)"
                ></el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-table-draggable>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import ElTableDraggable from "element-ui-el-table-draggable";
export default {
  props: ["tabData"],
  components: { ElTableDraggable },
  data() {
    return {
      mouseOverRowId: "",
      isExpandable: false,
      width: 0,
      showActionColumn: false,
      columns: [],
      options: [
        {
          value: "Option1",
          label: "Option1"
        },
        {
          value: "Option2",
          label: "Option2"
        },
        {
          value: "Option3",
          label: "Option3"
        },
        {
          value: "Option4",
          label: "Option4"
        },
        {
          value: "Option5",
          label: "Option5"
        }
      ],
      selectedColumn: ["description"]
    };
  },
  methods: {
    handleSelectionChange(val) {
      this.$emit("handleSelectionChange", val);
    },
    handleEdit(index, row) {
      this.$emit("handleEdit", row);
      console.log(index, row);
    },
    handleDelete(index, row) {
      console.log(index, row);
    },
    handleCellMouseEnter(row) {
      this.mouseOverRowId = row.id;
    },
    handleCellMouseLeave() {
      this.mouseOverRowId = "";
    },
    handleResize(data) {
      this.width = data.target.clientWidth;
      if (this.width < 380) {
        this.isExpandable = true;
      } else {
        this.isExpandable = false;
      }
    },
    getSelectedColumns(selectedColumn, columns) {
      if (selectedColumn) {
        return columns.filter(column => {
          let result = false;
          selectedColumn.forEach(selColumn => {
            if (column.field == selColumn) {
              result = true;
            }
          });
          if (result) {
            return column;
          }
        });
      }
    }
  },
  mounted() {
    // setTimeout(() => {
    //   console.log(this.$refs.dataTable[0].$el.clientWidth);
    // }, 100);
  }
};
</script>

<style lang="scss" scoped>
</style>