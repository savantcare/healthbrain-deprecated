// If changed then show orange border

<template>
  <el-input
    :class="{'changed': isChanged}"
    type="textarea"
    :autosize="{ minRows: 2, maxRows: 4}"
    placeholder="Please input"
    v-model="inputValue"
    @input="updateValue"
  />
</template>

<script>
export default {
  props: ["value", "field"],
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

<style lang="scss" scoped>
</style>