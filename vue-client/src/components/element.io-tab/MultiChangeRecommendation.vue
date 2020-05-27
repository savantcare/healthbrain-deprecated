<template>
  <el-row :gutter="12">
    <el-col :span="8">
      <el-card class="box-card" shadow="hover">
        <el-form label-position="top" ref="form" :model="form">
          <el-form-item style="font-weight:bold" label="Description">
            <el-input :span="8" type="textarea" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="success" @click="onSubmit" size="small">Save</el-button>
            <el-button type="danger" @click="onSubmit" size="small">Discontinue</el-button>
          </el-form-item>
        </el-form>
        <el-row>
          <span style="font-size:14px">History:</span>
        </el-row>
        <br />
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
                :timestamp="activity.timestamp"
              >{{activity.content}}</el-timeline-item>
            </el-timeline>
          </div>
        </el-row>
        <br />
      </el-card>
    </el-col>
    <el-col :span="8">
      <el-card class="box-card" shadow="hover">
        <el-form label-position="top" ref="form" :model="form">
          <el-form-item style="font-weight:bold" label="Description">
            <el-input :span="8" type="textarea" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="success" @click="onSubmit" size="small">Save</el-button>
            <el-button type="danger" @click="onSubmit" size="small">Discontinue</el-button>
          </el-form-item>
        </el-form>
        <el-row>
          <span style="font-size:14px">History:</span>
        </el-row>
        <br />
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
                :timestamp="activity.timestamp"
              >{{activity.content}}</el-timeline-item>
            </el-timeline>
          </div>
        </el-row>
        <el-pagination small layout="prev, pager, next" :total="50"></el-pagination>
      </el-card>
    </el-col>
    <el-col :span="8">
      <el-card class="box-card" shadow="hover">
        <el-form label-position="top" ref="form" :model="form">
          <el-form-item style="font-weight:bold" label="Description">
            <el-input :span="8" type="textarea" v-model="form.desc" :autosize="{ minRows: 4}"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="success" @click="onSubmit" size="small">Save</el-button>
            <el-button type="danger" @click="onSubmit" size="small">Discontinue</el-button>
          </el-form-item>
        </el-form>
        <el-row>
          <span style="font-size:14px">History:</span>
        </el-row>
        <br />
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
                :timestamp="activity.timestamp"
              >{{activity.content}}</el-timeline-item>
            </el-timeline>
          </div>
        </el-row>
        <br />
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
export default {
  data() {
    return {
      editableTabsValue: "2",
      editableTabs: [
        {
          title: "Multi change recommendation",
          name: "recommendation",
          content: "recommendation"
        },
        {
          title: "Tab 2",
          name: "2",
          content: "Tab 2 content"
        }
      ],
      tabIndex: 2,
      form: {
        desc: "Recommendation1",
        when: ""
      },
      dialogVisible: true,
      dynamicValidateForm: {
        domains: [
          {
            key: 1,
            value: ""
          }
        ]
      },
      activities: [
        {
          content: "Recommendation1",
          timestamp: "25th May, 2020",
          size: "large",
          type: "primary"
        },
        {
          content: "Rex1",
          timestamp: "25th May, 2020",
          color: "#0bbd87"
        }
      ]
    };
  },
  methods: {
    handleTabsEdit(targetName, action) {
      if (action === "add") {
        let newTabName = ++this.tabIndex + "";
        this.editableTabs.push({
          title: "New Tab",
          name: newTabName,
          content: "New Tab content"
        });
        this.editableTabsValue = newTabName;
      }
      if (action === "remove") {
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
      console.log("submit!");
    },
    handleClose(done) {
      done();
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          alert("submit!");
        } else {
          console.log("error submit!!");
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
        value: ""
      });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>