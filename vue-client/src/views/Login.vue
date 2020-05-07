<template>
  <b-container>
    <b-row class="mt-4">
      <b-col style="display: flex; justify-content: center;">
        <b-card style="width: 500px;" title="Login to HealthBrain">
          <b-form @submit="onSubmit" @reset="onReset">
            <b-form-group id="input-group-1" label="Email address:" label-for="input-1">
              <b-form-input
                id="input-1"
                v-model="form.email"
                type="email"
                required
                placeholder="Enter email"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="input-group-2" label="Password:" label-for="input-2">
              <b-form-input
                id="input-2"
                v-model="form.password"
                type="password"
                required
                placeholder="Enter password"
              ></b-form-input>
            </b-form-group>

            <b-button type="submit" variant="primary">Login</b-button>
          </b-form>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { LOGIN_API_URL } from "@/const.js";
export default {
  data() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    async onSubmit(evt) {
      evt.preventDefault();

      try {
        const response = await fetch(LOGIN_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8"
          },
          body: JSON.stringify(this.form)
        });
        if (response.ok) {
          const json = await response.json();
          const { access_token, roleId } = json;
          localStorage.setItem("token", access_token);
          this.$store.dispatch("getRoleDetails", roleId);
          // this.$store.commit("setUserRole", role);
          this.$router.push("/?patient_id=1");
        } else {
          this.$bvToast.toast("Authentication failed", {
            title: "Error",
            variant: "danger",
            solid: true,
            toaster: "b-toaster-top-center"
          });
        }
      } catch (ex) {
        console.log(ex.message);
      }
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.email = "";
      this.form.name = "";
      this.form.food = null;
      this.form.checked = [];
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    }
  }
};
</script>