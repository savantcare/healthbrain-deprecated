<template>
    <el-row :gutter="12">

        <el-carousel :interval="5000" arrow="always" :autoplay="false">
            <el-carousel-item v-for="item in sliderSet" :key="item">
                <el-col :span="8" v-for="(diagnoses, index) in item.diagnosis" :key="index">
                    <el-card  class="box-card" shadow="hover" style="font-family: Helvetica;">
                        <div><b>Name:</b> {{diagnoses.name}}</div>
                        <div><b>Added by:</b> {{diagnoses.addedBy}} on {{diagnoses.addedOn}}</div>
                        <el-divider></el-divider>
                        <el-form label-position="top" ref="diagnoses" :model="diagnoses" >
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
            </el-carousel-item>
        </el-carousel>
    </el-row>
</template>
<script>
  export default {
    data() {
      return {
          sliderSet:[{
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
            }]
          },
          {
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

<style>
.el-carousel__container{
    height: 500px !important;
}
.el-carousel__item {
    overflow-y: scroll !important;
}
</style>