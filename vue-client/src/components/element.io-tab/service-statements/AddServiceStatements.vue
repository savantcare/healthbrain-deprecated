<template>
    <el-row :gutter="12">
        <el-col :span="24">
            <el-card class="box-card">
                <el-form 
                label-position="top" 
                :model="dynamicValidateForm" 
                ref="dynamicValidateForm" 
                class="demo-dynamic">
                    <el-card 
                    class="box-card" 
                    v-for="(domain) in dynamicValidateForm.domains" 
                    :key="domain.key" 
                    style="margin-bottom: 20px;">
                        <el-row>
                            <el-col :span="2" :offset="24">
                                <i class="el-icon-close" @click.prevent="removeDomain(domain)"></i>
                            </el-col>
                        </el-row>
                        <el-form-item 
                        style="font-weight:bold" 
                        label="Statement name" 
                        :prop="'value'" 
                        label-position="top" 
                        :rules="{required: true, message: 'Service statement name can not be blank', trigger: 'blur'}">
                            <el-select
                            v-model="domain.value" 
                            filterable 
                            placeholder="Select from dropdown" 
                            style="width: 100%;"> 
                                <el-option
                                v-for="item in serviceStatementsList"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                                </el-option>
                            </el-select>
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
</template>
<script>
  export default {
    data() {
      return {
        editableTabsValue: '2',
        editableTabs: [
          
        ],
        tabIndex: 2,
        form: {

        },
        dialogVisible: true,
        dynamicValidateForm: {
          domains: [{
            key: 1,
            value: '',
            when: ''
          }]
        },
        serviceStatementsList: [{
          value: 'Patient is deemed low risk.',
          label: 'Patient is deemed low risk.'
        }, {
          value: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
          label: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.'
        }, {
          value: 'Further data and history obtained from family member as per patient’s consent.',
          label: 'Further data and history obtained from family member as per patient’s consent.'
        }, {
          value: 'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.',
          label: 'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.'
        }],
      }
    },
    methods: {
      handleTabsEdit(targetName, action) {
        if (action === 'add') {
          let newTabName = ++this.tabIndex + '';
          this.editableTabs.push({
            title: 'New Tab',
            name: newTabName,
            content: 'New Tab content'
          });
          this.editableTabsValue = newTabName;
        }
        if (action === 'remove') {
          let tabs = this.editableTabs;
          let activeName = this.editableTabsValue;
          if (activeName === targetName) {
            tabs.forEach((tab, index) => {
              if (tab.name === targetName) {
                let nextTab = tabs[index + 1] || tabs[index - 1];
                if (nextTab) {
                  activeName = nextTab.name;
                }
              }
            });
          }
          
          this.editableTabsValue = activeName;
          this.editableTabs = tabs.filter(tab => tab.name !== targetName);
        }
      },
      onSubmit() {
        console.log('submit!');
      },
      handleClose(done) {
        done();
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      removeDomain(item) {
        var index = this.dynamicValidateForm.domains.indexOf(item);
        if (index !== -1) {
          this.dynamicValidateForm.domains.splice(index, 1);
        }
      },
      addDomain() {
        this.dynamicValidateForm.domains.push({
          key: Date.now(),
          value: ''
        });
      }
    } 
  }
</script>