<template>
  <el-dialog
  :visible.sync="dialogVisible"
  width="80%"
  :before-close="handleClose">
    <el-tabs type="card">
      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px;font-family: Helvetica;">Assessment diagnosis</span>
        <el-row :gutter="12">
          <el-col :span="8"
              v-for="(diagnoses, index) in diagnosis"
              :key="index">
            <el-card  class="box-card" shadow="hover" style="font-family: Helvetica;">
              <div><b>Name:</b> {{diagnoses.name}}</div>
              <div><b>Added by:</b> {{diagnoses.addedBy}} on {{diagnoses.addedOn}}</div>
              <el-divider></el-divider>
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item style="font-weight:bold" label="Change assessment">
                  <el-input :span="8" type="textarea" v-model="diagnoses.currentAssessment" :autosize="{ minRows: 4}"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="success" @click="onSubmit" size="small">Save</el-button>
                </el-form-item>
              </el-form>
              <el-row><span style="font-size:14px">History:</span></el-row><br>
              <el-row :gutter="12">
                  <div class="block">
                    <el-timeline>
                      <el-timeline-item
                        v-for="(assessment, index) in diagnoses.assessments"
                        :key="index"
                        :icon="assessment.icon"
                        :type="assessment.type"
                        :color="assessment.color"
                        :size="assessment.size"
                        :timestamp="assessment.timestamp">
                        {{assessment.content}}
                      </el-timeline-item>
                    </el-timeline>
                  </div>
              </el-row>
              <el-pagination
                small
                layout="prev, pager, next"
                :total="50">
              </el-pagination>
            </el-card> 
          </el-col>
        </el-row>
      </el-tab-pane>
      <!--End Multi Change recommendation-->

      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:20px"> Add diagnosis</span>
        <el-row :gutter="12">
          <el-col :span="24">
            <el-card class="box-card">
              <el-form label-position="top" :model="dynamicValidateForm" ref="dynamicValidateForm" class="demo-dynamic">


                <el-card class="box-card" v-for="(domain) in dynamicValidateForm.domains" :key="domain.key" style="margin-bottom: 20px;">
                  <el-row>
                    <el-col :span="2" :offset="24">
                      <i class="el-icon-close" @click.prevent="removeDomain(domain)"></i>
                    </el-col>
                  </el-row>
                  <el-form-item style="font-weight:bold" label="Name" :prop="'value'" label-position="top" :rules="{required: true, message: 'Diagnosis can not be blank', trigger: 'blur'}">
                    <el-select v-model="domain.value" filterable placeholder="Select" style="width: 100%;"> 
                      <el-option
                        v-for="item in diagnosisList"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>
                  <el-form-item style="font-weight:bold" label="When diagnosed" :prop="'when'" label-position="top" :rules="{required: true, message: 'Date can not be blank', trigger: 'blur'}">
                    <el-date-picker type="date" placeholder="Pick a date" v-model="domain.when" style="width: 100%;"></el-date-picker>
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
      </el-tab-pane>
      
      <!--End Multi Add recommendation-->
    </el-tabs>

  </el-dialog>
</template>   
<script>
  export default {
    data() {
      return {
        editableTabsValue: '2',
        editableTabs: [{
          title: 'Assessment diagnosis',
          name: 'assessment',
          content: 'Assessment'
        }, 
        {
          title: 'Add diagnosis',
          name: '2',
          content: 'Tab 2 content'
        }],
        tabIndex: 2,
        form: {
          desc: 'Current assessment for this diagnosis'
        },
        dialogVisible: true,
        dynamicValidateForm: {
          domains: [{
            key: 1,
            value: '',
            when: ''
          }]
        },
        diagnosis: [{
          name: 'Bacterial intestinal infection, unspecified',
          addedBy: 'Dr. Sonia P',
          addedOn: 'Apr 27, 2020',
          currentAssessment: 'Current assessment for this diagnosis',
          assessments: [{
            content: 'Current assessment for this diagnosis',
            timestamp: 'May 25, 2020',
            size: 'large',
            type: 'primary',
          }, {
            content: 'Previous assessment for this diagnosis',
            timestamp: 'May 14, 2020',
            color: '#0bbd87'
          }, {
            content: 'First assessment for this diagnosis',
            timestamp: 'Apr 27, 2020',
            color: '#0bbd87'
          }]
        }, {
          name: 'Adjustment disorder, With depressed mood',
          addedBy: 'Dr. Sonia P',
          addedOn: 'Apr 22, 2020',
          currentAssessment: 'Current assessment for this diagnosis',
          assessments: [{
            content: 'Current assessment for this diagnosis',
            timestamp: 'May 25, 2020',
            size: 'large',
            type: 'primary',
          }, {
            content: 'First assessment for this diagnosis',
            timestamp: 'Apr 22, 2020',
            color: '#0bbd87'
          }]
        }, {
          name: 'Generalized anxiety disorder',
          addedBy: 'Dr. Sonia P',
          addedOn: 'Mar 22, 2020',
          currentAssessment: 'Current assessment for this diagnosis',
          assessments: [{
            content: 'Current assessment for this diagnosis',
            timestamp: 'Apr 02, 2020',
            size: 'large',
            type: 'primary',
          }, {
            content: 'First assessment for this diagnosis',
            timestamp: 'Mar 22, 2020',
            color: '#0bbd87'
          }]
        }],
        diagnosisList: [{
          value: 'Bacterial intestinal infection, unspecified',
          label: 'Bacterial intestinal infection, unspecified'
        }, {
          value: 'Adjustment disorder, With depressed mood',
          label: 'Adjustment disorder, With depressed mood'
        }, {
          value: 'Adjustment disorder, With anxiety',
          label: 'Adjustment disorder, With anxiety'
        }, {
          value: 'Generalized anxiety disorder',
          label: 'Generalized anxiety disorder'
        }, {
          value: 'Other specified bacterial intestinal infections',
          label: 'Other specified bacterial intestinal infections'
        }, {
          value: 'Catatonia associated with another mental disorder (catatonia specifier)',
          label: 'Catatonia associated with another mental disorder (catatonia specifier)'
        }, {
          value: 'Adult antisocial behavior',
          label: 'Adult antisocial behavior'
        }, {
          value: 'Spouse or partner abuse, Psychological, Confirmed, Initial encounter',
          label: 'Spouse or partner abuse, Psychological, Confirmed, Initial encounter'
        }, {
          value: 'Adjustment disorder, Unspecified',
          label: 'Adjustment disorder, Unspecified'
        }, {
          value: 'Child neglect or abandonment, confirmed subsequent encounter',
          label: 'Child neglect or abandonment, confirmed subsequent encounter'
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