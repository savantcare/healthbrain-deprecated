<template>
  <div>
    <!-- <el-tab-pane> -->
    <el-row :gutter="12">
      <el-col :span="24">
        <el-card class="box-card">
          <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" class="demo-dynamic">
            <el-form-item
              v-for="(domain) in dynamicValidateForm.domains"
              :key="domain.key"
              :prop="'desc'"
              label-position="top"
              :rules="{
                    required: true, message: 'Description can not be blank', trigger: 'blur'
                  }"
            >
              <el-row>
                <el-col :span="2" :offset="24">
                  <i class="el-icon-close" @click.prevent="removeDomain(domain)"></i>
                </el-col>
              </el-row>
              <el-input
                :span="8"
                type="textarea"
                v-model="domain.value"
                placeholder="You may enter multi line text"
                :autosize="{ minRows: 4}"
              ></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="success" @click="submitForm('dynamicValidateForm')" size="small">Save</el-button>
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
export default {
  data() {
    return {
      dynamicValidateForm: {
        domains: [
          {
            key: 1,
            value: ""
          }
        ]
      }
    };
  },
  methods: {
    removeDomain(item) {
      var index = this.dynamicValidateForm.domains.indexOf(item);
      if (index !== -1) {
        this.dynamicValidateForm.domains.splice(index, 1);
      }
    },
    addDomain() {
      this.dynamicValidateForm.domains.push({
        key: Date.now(),
        value: ""
      });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>