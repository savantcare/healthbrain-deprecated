<template>
  <div>
    <b-card
      :border-variant="style"
      :header="style"
      :header-bg-variant="style"
      header-text-variant="white"
      style="height: 200px; overflow:auto;"
    >
      <template v-slot:header>
        <b-row align-h="between" style="height: 30px">
          <span style="font-weight: bold;">Test Panel</span>
        </b-row>
      </template>
      <b-card-text>
        <div class="table-responsive">
          <table class="table table-bordered table-sm table-hover">
            <thead>
              <tr>
                <th class="priority-1" width="15%">First Name</th>
                <th class="priority-2" width="15%">Last Name</th>
                <th class="priority-3" width="15%">Address</th>
                <th class="priority-4" width="10%">Phone</th>
                <th class="priority-5" width="15%">DOB</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Tony</td>
                <td class="priority-2">Stark</td>
                <td class="priority-3">Texas</td>
                <td class="priority-4">8899886655</td>
                <td class="priority-5">05-10-1984</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
              <tr>
                <td class="priority-1">Barry</td>
                <td class="priority-2">Allen</td>
                <td class="priority-3">Florida</td>
                <td class="priority-4">2211335566</td>
                <td class="priority-5">02-02-1983</td>
              </tr>
            </tbody>
          </table>
        </div>
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
export default {
  computed: {
    style() {
      return this.$store.getters.style;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>