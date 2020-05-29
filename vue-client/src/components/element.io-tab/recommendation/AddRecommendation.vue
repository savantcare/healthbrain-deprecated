<template>
  <div>
    <!-- <el-tab-pane> -->
    <el-row :gutter="12">
          <el-col :span="24">
            <el-card class="box-card">
              <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" class="demo-dynamic">
               <el-card v-for="(domain) in dynamicValidateForm.domains"
                  :key="domain.key" class="box-card" shadow="hover">
                    <el-row><el-col :span="2" :offset="24">
                      <el-tooltip placement="top">
                        <div slot="content">multiple lines<br/>second line</div>
                        <i class="el-icon-close"  style="cursor:pointer;" @click.prevent="removeDomain(domain)"></i>
                      </el-tooltip>
                      
                    </el-col></el-row>
                    <el-form-item
                      :prop="'desc'"
                      label-position="top"
                      label="Description"
                      style="margin-bottom:20px"
                      :rules="{
                        required: true, message: 'Description can not be blank', trigger: 'blur'
                      }"
                    >
                      <el-input :span="8" type="textarea" v-model="domain.value" placeholder="You may enter multi line text" :autosize="{ minRows: 4}" :autofocus=true></el-input>
                    </el-form-item>
                </el-card>
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
  /**
 * Multi Add Recommendation form.
 * @displayName Add Recommendation
 */
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
    /**
       * Gets called when the user clicks on the Form individual setion
       * @param {item} item index of form
       * @public This is a public method
       */
    removeDomain(item) {
      var index = this.dynamicValidateForm.domains.indexOf(item);
      if (index !== 0) {
        this.dynamicValidateForm.domains.splice(index, 1);
      }
    },
    // ...
    ignoreMethod(){

    },
    /**
       * Gets called when the user clicks on the Add one more button
       * @public This is a public method
       */
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
