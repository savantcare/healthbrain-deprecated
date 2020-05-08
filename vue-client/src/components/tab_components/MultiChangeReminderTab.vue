<template>
  <b-tab title="Multi change reminder">
    <b-row cols="3">
      <b-col v-for="(item, index) in reminders" :key="`item-${index}`">
        <label>Description:</label>

        <b-form-textarea id="textarea-state" rows="5" autofocus v-model="item.description"></b-form-textarea>
        <b-form-invalid-feedback>Description content is required.</b-form-invalid-feedback>

        <b-button
          class="float-right mb-2 mt-2"
          variant="primary"
          size="sm"
          @click="update(item)"
        >Save</b-button>
      </b-col>
    </b-row>
  </b-tab>
</template>

<script>
export default {
  computed: {
    items() {
      return this.$store.state.reminder.list.filter(item => {
        return item.patientId == this.id && item.discontinue != true;
      });
    },
    id() {
      return this.$route.query.patient_id;
    }
  },
  data() {
    return {
      reminders: []
    };
  },
  mounted() {
    this.items.forEach(item => {
      this.reminders.push({
        id: item["id"],
        description: item["description"],
        createdAt: item["createdAt"],
        patientId: item["patientId"]
      });
    });
  },
  methods: {
    update(item) {
      this.$store.dispatch("updateReminder", {
        data: item,
        toast: this.$bvToast
      });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>