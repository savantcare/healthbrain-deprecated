<template>
  <el-dialog
  :visible.sync="dialogVisible"
  width="80%"
  :before-close="handleClose">
    <el-tabs type="card">
      <!--Start Multi Change Service Statement-->
      <el-tab-pane>
        <span slot="label" style="font-size:18px"> Multi change Service Statement</span>
        <el-row :gutter="12">
          <el-carousel :interval="5000" arrow="always" :autoplay="false">
            <el-carousel-item v-for="item in sliderSet" :key="item">
              
              <el-col :span="8" v-for="serviveStatement in item.serviveStatement" :key="serviveStatement">
                <el-card  class="box-card" shadow="hover">
                  <el-form label-position="top" ref="form" :model="form" >
                    <el-form-item label="Description" style="font-weight:bold">
                      <el-select style="width:100%" v-model="serviveStatement.description" filterable placeholder="Select from dropdown">
                        <el-option
                          v-for="item in form.options"
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
                            v-for="(activity, index) in activities"
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

<!--
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item label="Description" style="font-weight:bold">
                  <el-select style="width:100%" v-model="form.value" filterable placeholder="Select from dropdown">
                    <el-option
                      v-for="item in form.options"
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
              <el-row><span style="font-size:14px"> History:</span></el-row><br>
              <el-row :gutter="12">
                  <div class="block">
                    <el-timeline>
                      <el-timeline-item
                        v-for="(activity, index) in activities"
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
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item label="Description" style="font-weight:bold">
                  <el-select style="width:100%" v-model="form.value" filterable placeholder="Select from dropdown">
                    <el-option
                      v-for="item in form.options"
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
              <el-row><span style="font-size:14px"> History:</span></el-row><br>
              <el-row :gutter="12">
                  <div class="block">
                    <el-timeline>
                      <el-timeline-item
                        v-for="(activity, index) in activities"
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
              </el-row>
              <el-pagination
                small
                layout="prev, pager, next"
                :total="50">
              </el-pagination>
            </el-card> 
          </el-col>
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item label="Description" style="font-weight:bold">
                  <el-select style="width:100%" v-model="form.value" filterable placeholder="Select from dropdown">
                    <el-option
                      v-for="item in form.options"
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
              <el-row><span style="font-size:14px"> History:</span></el-row><br>
              <el-row :gutter="12">
                  <div class="block">
                    <el-timeline>
                      <el-timeline-item
                        v-for="(activity, index) in activities"
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
-->
          
        </el-row>
      </el-tab-pane>
      <!--End Multi Change Service Statement-->

      <!--Start Add Service Statement-->
      <el-tab-pane>
        <span slot="label" style="font-size:18px"> Add Service Statement</span>
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
                    <el-form-item label="Description" style="font-weight:bold">
                      <el-select style="width:100%" v-model="domain.value2" filterable placeholder="Select from dropdown">
                        <el-option
                          v-for="item in form.options"
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
      </el-tab-pane>

      
      <!--End Add Service Statement-->
    </el-tabs>

  </el-dialog>
</template>   
<script>
  export default {
    data() {
      return {
        editableTabsValue: '2',
        editableTabs: [{
          title: 'Multi change Service Statement',
          name: 'Service Statement',
          content: 'Service Statement'
        }, 
        {
          title: 'Tab 2',
          name: '2',
          content: 'Tab 2 content'
        }],
        tabIndex: 2,
        form: {
          desc: 'Service Statement1',
          options: [{
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
          value: 'Patient is deemed low risk.',
          value2: ''
        },
        dialogVisible: true,
        dynamicValidateForm: {
          domains: [{
            key: 1,
            value: 'Patient is deemed low risk.'
          }]
        },
        activities: [{
          content: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.',
          timestamp: '25th May, 2020',
          size: 'large',
          type: 'primary',
        }, {
          content: 'Patient is deemed low risk.',
          timestamp: '25th May, 2020',
          color: '#0bbd87'
        }],
        sliderSet:[{
          serviveStatement: [{
            description: 'Patient is deemed low risk.'
          }, {
            description: 'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.'
          }, {
            description: 'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed.'
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
        }]
      }
    },
    methods: {
    querySearch(queryString, cb) {
        var links = this.links;
        var results = queryString ? links.filter(this.createFilter(queryString)) : links;
        // call callback function to return suggestions
        cb(results);
      },
      createFilter(queryString) {
        return (link) => {
          return (link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
        };
      },
      loadAll() {
        return [
          { "value": "vue", "link": "https://github.com/vuejs/vue" },
          { "value": "element", "link": "https://github.com/ElemeFE/element" },
          { "value": "cooking", "link": "https://github.com/ElemeFE/cooking" },
          { "value": "mint-ui", "link": "https://github.com/ElemeFE/mint-ui" },
          { "value": "vuex", "link": "https://github.com/vuejs/vuex" },
          { "value": "vue-router", "link": "https://github.com/vuejs/vue-router" },
          { "value": "babel", "link": "https://github.com/babel/babel" }
         ];
      },
      handleSelect(item) {
        console.log(item);
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
    },
    mounted() {
      this.links = this.loadAll();
    }
  }
</script>

<style>
body {
    font-family: Helvetica;
}
label.el-form-item__label {
    line-height: 0;
}
</style>