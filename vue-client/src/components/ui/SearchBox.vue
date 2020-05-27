<template>
  <div id="search_component" v-bind:style="{width: width}">
    <!-- <b-list-group class="ml-2 mr-2">
      <b-list-group-item
        v-for="(item, index) in keywordComponents"
        :key="`search-${index}`"
        :active="index == selectedIndex"
      >{{item}}</b-list-group-item>
    </b-list-group>-->
    <!-- <b-form-input
      ref="search_box"
      v-model="searchKeyword"
      placeholder="(Type here - use backstick to highlight)"
      @keyup="keyupHandler"
      @click="onClickSearchBox"
    ></b-form-input>-->
    <!-- <el-card
      class="box-card"
      style="margin-left: 12px; margin-right: 12px;"
      v-if="keywordComponents.length > 0"
    >
      <el-table
        :data="keywordComponents"
        :show-header="false"
        style="width: 100%"
        :row-style="checkRowFocusStatus"
      >
        <el-table-column label="Component">
          <template slot-scope="scope">{{scope.row}}</template>
        </el-table-column>
      </el-table>
    </el-card>
    <el-input
      placeholder="(Type here - use backstick to highlight)"
      ref="search_box"
      prefix-icon="el-icon-search"
      v-model="searchKeyword"
      @keyup="keyupHandler"
      @click="onClickSearchBox"
    ></el-input>-->
    <el-autocomplete
      v-model="searchKeyword"
      :fetch-suggestions="querySearch"
      placeholder="(Type here - use backstick to highlight)"
      :trigger-on-focus="false"
      @select="handleSelect"
      prefix-icon="el-icon-search"
      style="width: 100%"
      ref="search_box"
    ></el-autocomplete>
  </div>
</template>

<script>
export default {
  name: "search-box",
  data() {
    return {
      searchKeyword: "",
      selectedIndex: 0
    };
  },
  computed: {
    width() {
      return this.$store.state.rightPanel.width;
    },
    keywordComponents() {
      if (this.searchKeyword.length == 0) {
        return [];
      }

      return this.$store.state.searchComponentList.filter(item => {
        return item.search(this.searchKeyword) > -1;
      });
    },
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
    }
  },
  watch: {
    focusRow() {
      if (this.focusRow == this.$options.name) {
        this.setFocus();
      } else if (this.focusRow != null) {
        this.removeFocus();
      }
    }
  },
  mounted() {
    this.$store.commit("setRightPanelWidth", "calc(30% - 4px)");
  },
  methods: {
    keyupHandler(event) {
      if (event.keyCode == 13) {
        const action = this.keywordComponents[this.selectedIndex];
        this.$emit("renderRightPanel", action);
        this.searchKeyword = "";
      } else if (event.key == "ArrowDown") {
        if (this.selectedIndex < this.keywordComponents.length - 1) {
          this.selectedIndex += 1;
        }
      } else if (event.key == "ArrowUp") {
        if (this.selectedIndex > 0) {
          this.selectedIndex -= 1;
        }
      }
      if (this.searchKeyword.length == 0) {
        this.selectedIndex = 0;
      }
      console.log(this.selectedIndex);
      this.$store.commit("setRightPanelSearchKeyword", this.searchKeyword);
    },
    setFocus() {
      setTimeout(() => {
        this.$refs.search_box.$el.getElementsByTagName("input")[0].focus();
      }, 50);
    },
    removeFocus() {
      // setTimeout(() => {
      //   this.$refs.search_box.blur();
      // }, 50);
      console.log("removeFocus from the searchBox");
    },
    onClickSearchBox() {
      console.log("clicked");
      // const { rows } = this.$store.state.rightPanel;
      // this.$store.commit("setRightPanelFocusRowIndex", rows.length - 1);
    },
    checkRowFocusStatus(object) {
      const { rowIndex } = object;
      if (rowIndex == this.selectedIndex) {
        return { "background-color": "#ecf5ff" };
      }
    },
    querySearch(queryString, cb) {
      const componentList = this.$store.state.searchComponentList;

      var results = queryString
        ? componentList.filter(this.createFilter(queryString))
        : componentList;
      // call callback function to return suggestions
      results = results.map(result => {
        return { value: result };
      });
      cb(results);
    },
    createFilter(queryString) {
      return link => {
        return link.toLowerCase().indexOf(queryString.toLowerCase()) === 0;
      };
    },
    handleSelect(item) {
      console.log(item);
    }
  }
};
</script>

<style lang="css">
#search_component {
  position: absolute;
  bottom: 0;
}
</style>
