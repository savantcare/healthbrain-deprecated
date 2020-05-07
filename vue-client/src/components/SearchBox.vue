<template>
  <div id="search_component" v-bind:style="{width: width}">
    <b-list-group class="ml-2 mr-2">
      <b-list-group-item
        v-for="(item, index) in keywordComponents"
        :key="`search-${index}`"
        :active="index == 0"
      >{{item}}</b-list-group-item>
    </b-list-group>
    <b-form-input
      ref="search_box"
      v-model="searchKeyword"
      placeholder="(Type here - use backstick to highlight)"
      @keyup="keyupHandler"
    ></b-form-input>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchKeyword: ""
    };
  },
  computed: {
    width() {
      return this.$store.state.rightPanel.width;
    },
    focusComponent() {
      return this.$store.state.focusComponent;
    },
    keywordComponents() {
      if (this.searchKeyword.length == 0) {
        return [];
      }

      return this.$store.state.SEARCH_COMPONENT_LIST.filter(item => {
        return item.search(this.searchKeyword) > -1;
      });
    }
  },
  mounted() {
    this.$store.commit("setRightPanelWidth", "30%");
  },
  methods: {
    keyupHandler(event) {
      if (event.keyCode == 13) {
        const action = this.keywordComponents[0];
        this.$emit("renderRightPanel", action);
        this.searchKeyword = "";
      }
    },
    setFocus() {
      setTimeout(() => {
        this.$refs.search_box.focus();
      }, 50);
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
