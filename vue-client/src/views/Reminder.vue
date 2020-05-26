<template>
  <el-container>
    <!--<el-tabs v-model="editableTabsValue" type="card" editable @edit="handleTabsEdit">
      <el-tab-pane
        v-for="(item) in editableTabs"
        :key="item.name"
        :label="item.title"
        :name="item.name"
      >
        {{item.content}}
      </el-tab-pane>
    </el-tabs>-->

    <el-tabs type="card">
      <el-tab-pane>
        <span slot="label" style="font-size:22px"> Multi change reminder</span>
        <el-row :gutter="12">
          <el-col :span="8">
            <el-card class="box-card">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item  style="font-weight:bold" label="Description:">
                  <el-input :span="8" type="textarea" v-model="form.desc"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="success" @click="onSubmit">Save</el-button>
                </el-form-item>
              </el-form>
              <el-row><span> History:</span></el-row><br>
              <el-row :gutter="12">
                  <el-card shadow="always">
                    <span> Reminder1</span><br>
                    <span> Changed by User1 on 25th May, 2020</span>
                  </el-card>
              </el-row><br>
              <el-row :gutter="12">
                <el-card shadow="always">
                    <span> Rem1</span><br>
                    <span> Added by User1 on 20th May, 2020</span>
                </el-card>
              </el-row>
            </el-card> 
          </el-col>
          <el-col :span="8">
            <el-card class="box-card">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item  style="font-weight:bold" label="Description:">
                  <el-input :span="8" type="textarea" v-model="form.desc"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="success" @click="onSubmit">Save</el-button>
                </el-form-item>
              </el-form>
              <el-row><span> History:</span></el-row><br>
              <el-row :gutter="12">
                  <el-card shadow="always">
                    <span> Reminder1</span><br>
                    <span> Changed by User1 on 25th May, 2020</span>
                  </el-card>
              </el-row><br>
              <el-row :gutter="12">
                <el-card shadow="always">
                    <span> Rem1</span><br>
                    <span> Added by User1 on 20th May, 2020</span>
                </el-card>
              </el-row>
            </el-card> 
          </el-col>
          <el-col :span="8">
            <el-card class="box-card">
              <el-form label-position="top" ref="form" :model="form" >
                <el-form-item  style="font-weight:bold" label="Description:">
                  <el-input :span="8" type="textarea" v-model="form.desc"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="success" @click="onSubmit">Save</el-button>
                </el-form-item>
              </el-form>
              <el-row><span> History:</span></el-row><br>
              <el-row :gutter="12">
                  <el-card shadow="always">
                    <span> Reminder1</span><br>
                    <span> Changed by User1 on 25th May, 2020</span>
                  </el-card>
              </el-row><br>
              <el-row :gutter="12">
                <el-card shadow="always">
                    <span> Rem1</span><br>
                    <span> Added by User1 on 20th May, 2020</span>
                </el-card>
              </el-row>
            </el-card> 
          </el-col>
          
        </el-row>
             

      </el-tab-pane>
    </el-tabs>

  </el-container>
</template>   
<script>
  export default {
    data() {
      return {
        editableTabsValue: '2',
        editableTabs: [{
          title: 'Multi change reminder',
          name: 'reminder',
          content: 'reminder'
        }, 
        {
          title: 'Tab 2',
          name: '2',
          content: 'Tab 2 content'
        }],
        tabIndex: 2,
        form: {
          desc: ''
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
      }
    }
  }
</script>