<template>
  <el-row :gutter="12">
    <el-tag  v-for="tag in tags"  :key="tag.name"  closable  :type="tag.type">
        {{tag.name}}
    </el-tag>
    <br />
    <br />
    <el-col :span="8" :key="question.id" v-for="question in questionList" >
      <el-card class="box-card" shadow="hover">
        <el-form label-position="top" ref="form" :model="form">
            <p><strong>Q</strong> {{question.name}}</p>
            <el-form-item label="">
                <span><strong>Answer </strong></span>
                <el-select v-model="question.selectedAnswer" size="mini" placeholder="Select">
                    <el-option v-for="item in answerList" :key="item.value" :label="item.label" :value="item.value">
                    </el-option>
                </el-select>

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
      editableTabsValue: "2",
      editableTabs: [
        {
          title: "Multi change screening",
          name: "screening",
          content: "screening"
        },
        {
          title: "Tab 2",
          name: "2",
          content: "Tab 2 content"
        }
      ],
       tags: [
          { name: 'SPIN', type: 'warning' }
        ],
       questionList: [
          { id: 1, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I am afraid of people in authority',  },
          { id: 2, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I am bothered by blushing in front of people' },
          { id: 3, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Parties and social events scare me' },
          { id: 4, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I avoid talking to people I don\'t know' },
          { id: 5, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Being criticized scares me a lot' },
          { id: 6, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Fear of embarrassment causes me to avoid doing things or speaking to people' },
          { id: 7, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Sweating in front of people causes me distress' },
          { id: 8, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I avoid going to parties' },
          { id: 9, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I avoid activities in which I am the centre of attention' },
          { id: 10, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Talking to strangers scares me' },
          { id: 11, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I avoid having to give speeches' },
          { id: 12, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I would do anything to avoid being criticized' },
          { id: 13, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Heart palpitations bother me when I am around people' },
          { id: 14, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I am afraid of doing things when people might be watching' },
          { id: 15, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Being embarrassed or looking stupid is among my worst fears' },
          { id: 16, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... I avoid speaking to anyone in authority' },
          { id: 17, selectedAnswer: '', name: 'How much the following problems have bothered you during the past week... Trembling or shaking in front of others is distressing to me' }
        ],
       answerList: [
          { value: 1, label: 'Not at all',  },
          { value: 2, label: 'A little bit' },
          { value: 3, label: 'Somewhat' },
          { value: 4, label: 'Very much' },
          { value: 5, label: 'Extremely' }
        ],
        value: '',
      tabIndex: 2,
      form: {
        desc: "screening1",
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
          content: "screening1",
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
.el-col-8 {
    padding-top: 6px;
    padding-bottom: 6px;
}
</style>