<template>
  <el-input
    :class="{'changed': isChanged}"
    v-model="inputValue"
    :placeholder="placeholder"
    clearable
    @input="updateValue"
  ></el-input>
</template>

<script>
export default {
  props: ["value", "placeholder", "field"],
  data() {
    return {
      inputValue: "",
      originValue: ""
    };
  },
  mounted() {
    this.inputValue = this.value;
    this.originValue = this.value;
  },
  computed: {
    isChanged() {
      if (this.inputValue != this.originValue) {
        this.$emit("updateValidateChanges", {
          field: this.field,
          value: false
        });
        return true;
      }
      this.$emit("updateValidateChanges", { field: this.field, value: true });
      return false;
    }
  },
  methods: {
    updateValue(value) {
      this.$emit("input", value);
    }
  }
};
</script>

<style lang="scss">
</style>