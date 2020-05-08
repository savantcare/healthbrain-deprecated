<template>
  <b-tab :title="modalTitle">
    <label>Description:</label>

    <b-form-textarea
      id="textarea-state"
      v-model="description"
      :state="validation"
      rows="5"
      autofocus
    ></b-form-textarea>
    <b-form-invalid-feedback :state="validation">Description content is required.</b-form-invalid-feedback>

    <b-button
      class="float-right mb-2 mt-2"
      variant="primary"
      size="sm"
      @click="save"
      :disabled="!validation"
    >{{buttonText}}</b-button>
  </b-tab>
</template>

<script>
import { ADD_REMINDER, EDIT_REMINDER } from "@/const.js";
import uniqid from "uniqid";

export default {
  data() {
    return {
      description: ""
    };
  },
  computed: {
    type() {
      return this.$store.state.tabDialog.reminderTabType;
    },
    modalTitle() {
      if (this.type == ADD_REMINDER) {
        return "Add Reminder";
      }
      return "Edit Reminder";
    },
    buttonText() {
      if (this.type == ADD_REMINDER) {
        return "Save";
      }
      return "Update";
    },
    validation() {
      return this.description.length > 0;
    },
    id() {
      return this.$route.query.patient_id;
    },
    updateData() {
      return this.$store.state.tabDialog.reminderData;
    }
  },
  methods: {
    save() {
      if (this.type == ADD_REMINDER) {
        const today = new Date();
        const data = {
          createdAt: today.toDateString(),
          id: uniqid(),
          patientId: this.id,
          description: this.description
        };

        this.$store.dispatch("addReminder", {
          data: data,
          toast: this.$bvToast
        });
      } else {
        this.updateData["description"] = this.description;
        this.$store.dispatch("updateReminder", {
          data: this.updateData,
          toast: this.$bvToast
        });
      }
      this.$store.commit("setTabDialogVisibility", false);
    }
  },
  mounted() {
    if (this.type == EDIT_REMINDER) {
      this.description = this.updateData.description;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>