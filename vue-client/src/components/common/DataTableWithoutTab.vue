<template>
  <div v-elresize @elresize="handleResize">
   <el-table-draggable>
      <el-table
        ref="dataTable"
        :data="dataToDisplay.tableData"
        @selection-change="handleSelectionChange"
        @cell-mouse-enter="handleCellMouseEnter"
        @cell-mouse-leave="handleCellMouseLeave"
        size="mini">
        <el-table-column type="expand">
          <template>
            <div>
              <el-button
                size="mini"
                v-if="dataToDisplay.rowActions.indexOf('C') > -1"
                @click="handleEdit(scope.row)"
              >Edit</el-button>
              <el-button
                size="mini"
                type="danger"
                v-if="dataToDisplay.rowActions.indexOf('D') > -1"
                @click="handleDelete(scope.row)"
              >Discontinue</el-button>
            </div>
          </template>
        </el-table-column>
        <el-table-column type="selection"></el-table-column>
        <el-table-column
          v-for="(column, index_column) in getSelectedColumns(dataToDisplay.selectedColumn, dataToDisplay.columns)"
          :key="`tab-column-${index_column}`"
          :label="column.label "
          :property="column.field"
          :sortable="column.sortable"
        ></el-table-column>
        <el-table-column v-if="false">
          <template slot-scope="scope" v-if="scope.row.id == mouseOverRowId">
            <el-button
              size="mini"
              icon="el-icon-edit"
              circle
              v-if="dataToDisplay.rowActions.indexOf('C') > -1"
              @click="handleEdit(scope.row)"
            ></el-button>
            <el-button
              size="mini"
              type="danger"
              icon="el-icon-delete"
              circle
              v-if="dataToDisplay.rowActions.indexOf('D') > -1"
              @click="handleDelete(scope.row)"
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-table-draggable>
  </div>
</template>

<script>
import ElTableDraggable from "element-ui-el-table-draggable";
export default {
  props: ["dataToDisplay"],
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
      ]
    };
  },
  methods: {
    handleSelectionChange(val) {
      this.$emit("handleSelectionChange", val);
    },
    handleEdit(row) {
      console.log(row);
    },
    handleDelete(row) {
      console.log(row);
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