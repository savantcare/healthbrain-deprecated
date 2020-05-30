<template>
    <el-row :gutter="12">

        <el-carousel 
        :interval="5000" 
        arrow="always" 
        :autoplay="false">
            <el-carousel-item 
            v-for="item in sliderSet" 
            :key="item">
                <el-col :span="8" v-for="serviveStatement in item.serviveStatement" :key="serviveStatement">
                <el-card  class="box-card" shadow="hover">
                  <el-form label-position="top" ref="form" :model="form" >
                    <el-form-item label="Description" style="font-weight:bold">
                      <el-select style="width:100%" v-model="serviveStatement.description" filterable placeholder="Select from dropdown">
                        <el-option
                          v-for="item in serviceStatementsList"
                          :key="item.value"
                          :label="item.label"
                          :value="item.value">
                        </el-option>
                      </el-select>
                    </el-form-item>
                    <el-form-item>
                      <el-button type="success" @click="onSubmit" size="small">Save</el-button>
                      <el-button type="danger" @click="onSubmit" size="small">Discontinue</el-button>
                    </el-form-item>
                  </el-form>
                  <el-row><span style="font-size:14px;font-weight:bold"> History:</span></el-row><br>
                  <el-row :gutter="12">
                      <div class="block">
                        <el-timeline>
                          <el-timeline-item
                            v-for="(activity, index) in serviveStatement.activities"
                            :key="index"
                            :icon="activity.icon"
                            :type="activity.type"
                            :color="activity.color"
                            :size="activity.size"
                            :timestamp="activity.timestamp">
                            {{activity.content}}
                          </el-timeline-item>
                        </el-timeline>
                      </div>
                  </el-row><br>
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
          serviveStatement: [{
            description: 'Patient is deemed low risk.',
            activities: [{
              content: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
              timestamp: '25th May, 2020',
              size: 'large',
              type: 'primary',
            }, {
              content: 'Patient is deemed low risk.',
              timestamp: '25th May, 2020',
              color: '#0bbd87'
            }]
          }, {
            description: 'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.',
            activities: [{
              content: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
              timestamp: '25th May, 2020',
              size: 'large',
              type: 'primary',
            }, {
              content: 'Patient is deemed low risk.',
              timestamp: '25th May, 2020',
              color: '#0bbd87'
            }]
          }, {
            description: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
            activities: [{
              content: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
              timestamp: '25th May, 2020',
              size: 'large',
              type: 'primary',
            }, {
              content: 'Patient is deemed low risk.',
              timestamp: '25th May, 2020',
              color: '#0bbd87'
            }]
          }]
        }, {
          serviveStatement: [{
            description: 'Patient is deemed low risk.'
          }, {
            description: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.'
          }, {
            description: 'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.'
          }]
        }, {
          serviveStatement: [{
            description: 'Further data and history obtained from family member as per patient’s consent.'
          }, {
            description: 'Patient is deemed low risk.'
          }, {
            description: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.'
          }]
        }],
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

<style>
.el-carousel__container{
    height: 500px !important;
}
.el-carousel__item {
    overflow-y: scroll !important;
}
</style>