<template>
  <el-dialog
  :visible.sync="dialogVisible"
  width="80%"
  :before-close="handleClose">
    <el-tabs type="card">
      <!--Start Multi Change goals-->
      <el-tab-pane>
        <span slot="label" style="font-size:20px"> Multi rate goals</span>
        <el-row :gutter="12">
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item style="font-weight:bold" label="Description:">
                  <el-input :span="8" v-model="form.desc" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Score:">
                  <el-slider v-model="form.score" :format-tooltip="formatTooltip"></el-slider>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Date:">
                  <el-date-picker :span="8" v-model="form.when" type="date" placeholder="Pick a day" :picker-options="pickerOptions1" style="width: 100%;"></el-date-picker>
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
          <el-col :span="8">
            <el-card  class="box-card" shadow="hover">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item style="font-weight:bold" label="Description:">
                  <el-input :span="8" v-model="form.desc" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Score:">
                  <el-slider v-model="form.score" :format-tooltip="formatTooltip"></el-slider>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Date:">
                  <el-date-picker :span="8" v-model="form.when" type="date" placeholder="Pick a day" :picker-options="pickerOptions1" style="width: 100%;"></el-date-picker>
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
                <el-form-item style="font-weight:bold" label="Description:">
                  <el-input :span="8" v-model="form.desc" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Score:">
                  <el-slider v-model="form.score" :format-tooltip="formatTooltip"></el-slider>
                </el-form-item>
                <el-form-item style="font-weight:bold" label="Date:">
                  <el-date-picker :span="8" v-model="form.when" type="date" placeholder="Pick a day" :picker-options="pickerOptions1" style="width: 100%;"></el-date-picker>
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
          
          
        </el-row>
      </el-tab-pane>
      <!--End Multi Change goals-->

      <!--Start Multi Change goals-->
      <el-tab-pane>
        <span slot="label" style="font-size:20px"> Add goals</span>
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
                  <el-form-item
                    :prop="'desc'"
                    style="font-weight:bold"
                    label-position="top"
                    label="Description"
                    :rules="{
                      required: true, message: 'Description can not be blank', trigger: 'blur'
                    }"
                  >
                    <el-input :span="8" type="textarea" v-model="domain.value" placeholder="You may enter multi line text" :autosize="{ minRows: 4}"></el-input>
                  </el-form-item>

                  <el-form-item
                    :prop="'start_date'"
                    style="font-weight:bold"
                    label-position="top"
                    label="Start date of goal"
                    :rules="{
                      required: true, message: 'Start date of goal can not be blank', trigger: 'blur'
                    }"
                  >
                    <el-date-picker :span="8" v-model="domain.when" type="date" placeholder="Pick a day" :picker-options="pickerOptions1" style="width: 100%;"></el-date-picker>
                  </el-form-item>
                  <el-form-item style="font-weight:bold" label="Score">
                    <el-slider v-model="form.score" :format-tooltip="formatTooltip"></el-slider>
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

      
      <!--End Multi Add goals-->
    </el-tabs>

  </el-dialog>
</template>   
<script>
  export default {
    data() {
      return {
        editableTabsValue: '2',
        editableTabs: [{
          title: 'Multi change goals',
          name: 'goals',
          content: 'goals'
        }, 
        {
          title: 'Tab 2',
          name: '2',
          content: 'Tab 2 content'
        }],
        tabIndex: 2,
        form: {
          desc: 'goals1',
          score: 45,
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
          content: '30',
          timestamp: '25th May, 2020',
          size: 'large',
          type: 'primary',
        }, {
          content: '67',
          timestamp: '25th May, 2020',
          color: '#0bbd87'
        }],
        pickerOptions1: {
          shortcuts: [{
            text: 'Today',
            onClick(picker) {
              picker.$emit('pick', new Date());
            }
          }, {
            text: 'Yesterday',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit('pick', date);
            }
          }, {
            text: 'A week ago',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
        }
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
label.el-form-item__label {
    line-height: 0;
}
</style>