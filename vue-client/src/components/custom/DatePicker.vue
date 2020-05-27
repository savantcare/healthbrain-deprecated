<template>
  <div>
    <el-input v-model="inputValue" @input="updateValue" placeholder="Please input " clearable></el-input>
    <el-date-picker
      type="date"
      :picker-options="pickerOptions"
      v-model="dateValue"
      @change="updateDate"
    ></el-date-picker>
  </div>
</template>

<script>
export default {
  props: ["value"],
  data() {
    return {
      pickerOptions: {
        shortcuts: [
          {
            text: "Today",
            onClick(picker) {
              picker.$emit("pick", new Date());
            }
          },
          {
            text: "Yesterday",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit("pick", date);
            }
          },
          {
            text: "A week ago",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", date);
            }
          }
        ]
      },
      dateValue: "",
      inputValue: ""
    };
  },
  mounted() {},
  methods: {
    updateValue(value) {
      this.$emit("input", value);
    },
    updateDate() {
      const date = new Date(this.dateValue);
      const yyyy = date.getFullYear();
      const mm = date.getMonth() + 1;
      const dd = date.getDate();

      this.inputValue = yyyy + "/" + mm + "/" + dd;
      this.$emit("input", this.inputValue);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>