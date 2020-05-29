<template>
  <div>
    <!-- <el-tab-pane> -->
    <el-row :gutter="12">
      <el-col :span="24">
        <el-card class="box-card">
          <el-form :model="recForm" ref="recForm" class="demo-dynamic">
            <el-form-item
              v-for="(domain, index) in recForm.recs"
              :key="index"
              :rules="{
                  required: true, message: 'Description can not be blank', trigger: 'blur'
              }"
              :prop="'recs.' + index + '.description'"
            >
              <el-card class="box-card" shadow="hover">
                <el-input
                  :span="8"
                  type="textarea"
                  v-model="domain.description"
                  placeholder="You may enter multi line text"
                  :autosize="{ minRows: 4}"
                  :autofocus="true"
                ></el-input>
              </el-card>
            </el-form-item>
            <el-form-item>
              <el-button type="success" @click="submitForm('recForm')" size="small">Save</el-button>
              <el-button type="primary" @click="addDomain" size="small">Add one more</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
    <!-- </el-tab-pane> -->
  </div>
</template>

<script>
/**
 * Multi Add Recommendation form.
 * @displayName Add Recommendation
 */
import uniqid from "uniqid";
import { EDIT_RECOMMENDATION } from "@/const.js";
export default {
  data() {
    return {
      id: this.$route.query.patient_id,
      recForm: { recs: [{ description: "" }] }
    };
  },
  methods: {
    addDomain() {
      this.recForm.recs.push({
        description: ""
      });
    },
    submitForm(formName) {
      const vm = this;
      this.$refs[formName].validate(async valid => {
        if (valid) {
          if (this.type == EDIT_RECOMMENDATION) {
            this.updateData["description"] = this.recForm.recs[0].description;
            this.updateData["discontinuedByUserId"] = this.userId;
            this.updateData["createdByUserId"] = this.userId;
            this.$store.dispatch("updateRecommendation", {
              data: this.updateData,
              notify: this.$notify
            });
          } else {
            let recList = [];
            this.recForm.recs.forEach(item => {
              recList.push({
                description: item.description,
                patientId: vm.id,
                recommendationID: uniqid()
              });
            });
            await this.$store.dispatch("addRecommendation", {
              data: recList,
              notify: this.$notify
            });
            await this.$store.dispatch("getRecommendations", {
              patientId: this.id,
              notify: this.$notify
            });
            this.recForm = { recs: [{ description: "" }] };
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    }
  },
  computed: {
    type() {
      return this.$store.state.tabDialog.recommendationTabType;
    },
    updateData() {
      return this.$store.state.tabDialog.recommendationData;
    },
    userId() {
      return this.$store.state.userId;
    }
  },
  mounted() {
    if (this.type == EDIT_RECOMMENDATION) {
      this.recForm = { recs: [{ description: this.updateData.description }] };
    }
  },
  watch: {
    updateData() {
      this.recForm = { recs: [{ description: this.updateData.description }] };
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
