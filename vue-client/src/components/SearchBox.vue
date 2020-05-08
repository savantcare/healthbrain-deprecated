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
      @click="setFocus"
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
      console.log(this.$store.state.rightPanel.width);
      return this.$store.state.rightPanel.width;
    },
    focusComponent() {
      return this.$store.state.focusComponent;
    },
    keywordComponents() {
      if (this.searchKeyword.length == 0) {
        return [];
      }

      return this.$store.state.searchComponentList.filter(item => {
        return item.search(this.searchKeyword) > -1;
      });
    },
    rightPanelComponents() {
      return this.$store.state.rightPanel.list;
    }
  },
  watch: {
    focusComponent() {
      if (this.focusComponent == "search-box") {
        setTimeout(() => {
          this.$refs.search_box.focus();
        }, 50);
      } else {
        this.$refs.search_box.blur();
      }
    }
  },
  mounted() {
    this.$store.commit("setRightPanelWidth", "30%");
  },
  methods: {
    keyupHandler(event) {
      if (this.focusComponent != "search-box") {
        return;
      }
      if (event.keyCode == 13) {
        const action = this.keywordComponents[0];
        this.$emit("renderRightPanel", action);
        this.searchKeyword = "";
      } else if (event.key == "ArrowDown") {
        // focus to the first component
        const firstComponent = this.rightPanelComponents[0]["key"];
        setTimeout(() => {
          this.$store.commit("setFocusComponent", firstComponent);
        }, 50);

        this.$refs.search_box.blur();
      } else if (event.key == "ArrowUp") {
        if (this.rightPanelComponents.length > 0) {
          const lastComponent = this.rightPanelComponents[
            this.rightPanelComponents.length - 1
          ]["key"];
          setTimeout(() => {
            this.$store.commit("setFocusComponent", lastComponent);
          }, 50);
        }
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
