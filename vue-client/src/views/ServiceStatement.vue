<template>
  <el-dialog
  :visible.sync="dialogVisible"
  width="80%"
  :before-close="handleClose">
    <el-tabs type="card">
      <!--Start Multi Change Service Statement-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px"> Multi change Service Statement</span>
        <el-row :gutter="12">
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item style="font-weight:bold">
                  <el-input :span="8" type="select" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
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
                <el-form-item style="font-weight:bold">
                  <el-input :span="8" type="select" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
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
                <el-form-item style="font-weight:bold">
                  <el-input :span="8" type="select" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
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
          
          
        </el-row>
      </el-tab-pane>
      <!--End Multi Change Service Statement-->

      <!--Start Multi Change Service Statement-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px"> Add Service Statement</span>
        <el-row :gutter="12">
          <el-col :span="24">
            <el-card class="box-card">
              <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" class="demo-dynamic">
                  <el-col :span="12">
    <el-autocomplete
      class="inline-input"
      v-model="state1"
      :fetch-suggestions="querySearch"
      placeholder="Please Input"
      @select="handleSelect"
    ></el-autocomplete>
  </el-col>
             
                <!--<el-form-item>
                  <el-button type="primary" @click="submitForm('dynamicValidateForm')">Submit</el-button>
                  <el-button @click="addDomain">New domain</el-button>
                  <el-button @click="resetForm('dynamicValidateForm')">Reset</el-button>
                </el-form-item>-->
                <el-form-item>
                  <el-button type="success" @click="submitForm('dynamicValidateForm')" size="small">Save</el-button>
                  <el-button type="primary" @click="addDomain" size="small">Add one more</el-button>
                </el-form-item>
              </el-form>


            </el-card> 
          </el-col>
        </el-row>
      </el-tab-pane>

      
      <!--End Multi Add Service Statement-->
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
          when: ''
        },
        dialogVisible: true,
        dynamicValidateForm: {
          domains: [{
            key: 1,
            value: ''
          }]
        },
        activities: [{
          content: 'Service Statement1',
          timestamp: '25th May, 2020',
          size: 'large',
          type: 'primary',
        }, {
          content: 'Rem1',
          timestamp: '25th May, 2020',
          color: '#0bbd87'
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
      }
    },
    mounted() {
      this.links = this.loadAll();
    }
  }
</script>