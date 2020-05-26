<template>
  <el-dialog :visible.sync="visibility" custom-class="multi-tab-dialog" width="70%" top="5vh">
    <el-tabs v-model="editableTabsValue" type="border-card" closable @tab-remove="removeTab">
      <el-tab-pane v-for="(item) in editableTabs" :key="item.name" :name="item.name">
        <span slot="label">
          {{title}}
          <el-button type="primary" size="mini">Last viewed on: {{lastViewDate}}</el-button>
        </span>
        <el-row :gutter="10">
          <el-col :span="6">
            <label>
              <span class="hl-label">B</span>iological Gender
            </label>
            <el-select v-model="biologicalGender" clearable placeholder="please select gender">
              <el-option
                v-for="item in genderOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-col>
          <el-col :span="6">
            <label>
              <span class="hl-label">P</span>atient preferred Gender
            </label>
            <el-select
              v-model="patientPreferredGender"
              clearable
              placeholder="please select gender"
            >
              <el-option
                v-for="item in genderOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-col>

          <el-col :span="8">
            <label>
              <span class="hl-label">D</span>ate of birth
            </label>
            <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
            <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
          </el-col>
        </el-row>
        <el-row class="mt-2" :gutter="10">
          <el-col :span="6">
            <label>
              <span>Bi</span>
              <span class="hl-label">r</span>th place
            </label>
            <el-input v-model="birthPlace" placeholder="Please input" clearable></el-input>
          </el-col>
          <el-col :span="6">
            <label>
              <span class="hl-label">L</span>ives with
            </label>
            <el-input v-model="livesWith" placeholder="Please input " clearable></el-input>
          </el-col>
          <el-col :span="6">
            <label>
              <span>Li</span>
              <span class="hl-label">v</span>es in
            </label>
            <el-input v-model="livesIn" placeholder="Please input " clearable></el-input>
          </el-col>
          <el-col :span="6">
            <label>
              #
              <span class="hl-label">o</span>f living children
            </label>
            <el-input v-model="numberOfLivingChildren" placeholder="Please input " clearable></el-input>
          </el-col>
        </el-row>
        <el-row :gutter="10" class="mt-2">
          <el-col :span="8">
            <label>
              <span class="hl-label">S</span>upports
            </label>
            <el-input
              type="textarea"
              :autosize="{ minRows: 2, maxRows: 4}"
              placeholder="Please input"
              v-model="supports"
              clearable
            />
          </el-col>
          <el-col :span="8" class="history-component">
            <el-card style="margin-bottom: 20px;">
              <label>
                <span class="hl-label">M</span>arital history
              </label>
              <br />
              <el-button type="primary" icon="el-icon-plus" size="small" circle></el-button>

              <div class="block">
                <el-timeline>
                  <el-timeline-item timestamp="2018/4/12" placement="top">
                    <el-card>
                      <h4>Update Github template</h4>
                      <p>Tom committed 2018/4/12 20:46</p>
                    </el-card>
                  </el-timeline-item>
                  <el-timeline-item timestamp placement="top">
                    <el-card>
                      <label for>Description:</label>
                      <el-input
                        type="textarea"
                        :autosize="{ minRows: 2, maxRows: 4}"
                        placeholder="Please input"
                      />
                      <div style="width: 90%; margin-top: 12px;">
                        <label for>Date:</label>
                        <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
                        <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
                      </div>
                    </el-card>
                  </el-timeline-item>
                </el-timeline>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8" class="history-component">
            <label>
              <span>O</span>
              <span class="hl-label">t</span>her major life events
            </label>
            <br />
            <el-button type="primary" icon="el-icon-plus" size="small" circle></el-button>

            <div class="block">
              <el-timeline>
                <el-timeline-item timestamp="2018/4/12" placement="top">
                  <el-card>
                    <h4>Update Github template</h4>
                    <p>Tom committed 2018/4/12 20:46</p>
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp placement="top">
                  <el-card>
                    <label for>Description:</label>
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 2, maxRows: 4}"
                      placeholder="Please input"
                    />
                    <div style="width: 90%; margin-top: 12px;">
                      <label for>Date:</label>
                      <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
                      <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
                    </div>
                  </el-card>
                </el-timeline-item>
              </el-timeline>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="10" class="mt-2">
          <el-col :span="8" class="history-component">
            <label>
              <span class="hl-label">D</span>evelopment history
            </label>
            <br />
            <el-button type="primary" icon="el-icon-plus" size="small" circle></el-button>

            <div class="block">
              <el-timeline>
                <el-timeline-item timestamp="2018/4/12" placement="top">
                  <el-card>
                    <h4>Update Github template</h4>
                    <p>Tom committed 2018/4/12 20:46</p>
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp placement="top">
                  <el-card>
                    <label for>Description:</label>
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 2, maxRows: 4}"
                      placeholder="Please input"
                    />
                    <div style="width: 90%; margin-top: 12px;">
                      <label for>Date:</label>
                      <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
                      <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
                    </div>
                  </el-card>
                </el-timeline-item>
              </el-timeline>
            </div>
          </el-col>
          <el-col :span="8" class="history-component">
            <label>
              <span class="hl-label">E</span>ducation history
            </label>
            <br />
            <el-button type="primary" icon="el-icon-plus" size="small" circle></el-button>

            <div class="block">
              <el-timeline>
                <el-timeline-item timestamp="2018/4/12" placement="top">
                  <el-card>
                    <h4>Update Github template</h4>
                    <p>Tom committed 2018/4/12 20:46</p>
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp placement="top">
                  <el-card>
                    <label for>Description:</label>
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 2, maxRows: 4}"
                      placeholder="Please input"
                    />
                    <div style="width: 90%; margin-top: 12px;">
                      <label for>Date:</label>
                      <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
                      <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
                    </div>
                  </el-card>
                </el-timeline-item>
              </el-timeline>
            </div>
          </el-col>
          <el-col :span="8" class="history-component">
            <label>
              <span>Emplo</span>
              <span class="hl-label">y</span>ment history
            </label>
            <br />
            <el-button type="primary" icon="el-icon-plus" size="small" circle></el-button>

            <div class="block">
              <el-timeline>
                <el-timeline-item timestamp="2018/4/12" placement="top">
                  <el-card>
                    <h4>Update Github template</h4>
                    <p>Tom committed 2018/4/12 20:46</p>
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp placement="top">
                  <el-card>
                    <label for>Description:</label>
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 2, maxRows: 4}"
                      placeholder="Please input"
                    />
                    <div style="width: 90%; margin-top: 12px;">
                      <label for>Date:</label>
                      <el-input v-model="dateOfBirth" placeholder="Please input " clearable></el-input>
                      <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
                    </div>
                  </el-card>
                </el-timeline-item>
              </el-timeline>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="10" class="mt-2"></el-row>
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      title: "Multi change social history",
      editableTabsValue: "1",
      editableTabs: [
        {
          title: "Tab 1",
          name: "1",
          content: "Tab 1 content"
        }
      ],
      tabIndex: 1,
      lastViewDate: "Jan 15th, 2020",
      genderOptions: [
        {
          value: "male",
          label: "Male"
        },
        {
          value: "female",
          label: "Female"
        }
      ],
      biologicalGender: "",
      patientPreferredGender: "",
      dateOfBirth: "",
      pickerOptions: {
        shortcuts: [
          {
            text: "Today",
            onClick(picker) {
              picker.$emit("pick", new Date());
            }
          },
          {
            text: "Yesterday",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit("pick", date);
            }
          },
          {
            text: "A week ago",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", date);
            }
          }
        ]
      },
      birthPlace: "",
      livesWith: "",
      livesIn: "",
      numberOfLivingChildren: "",
      supports: "",
      activeNames: ["1", "2", "3", "4", "5"]
    };
  },
  computed: {
    visibility: {
      get() {
        return this.$store.state.dialog.socialHistoryVisiblity;
      },
      set() {
        this.$store.commit("setSocialHistoryVisibility", false);
      }
    }
  },
  methods: {
    addTab() {
      let newTabName = ++this.tabIndex + "";
      this.editableTabs.push({
        title: "New Tab",
        name: newTabName,
        content: "New Tab content"
      });
      this.editableTabsValue = newTabName;
    },
    removeTab(targetName) {
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
  }
};
</script>

<style lang="scss">
.multi-tab-dialog {
  .el-dialog__header {
    display: none;
  }
  .el-dialog__body {
    padding: 0px;
  }
}
.mr-2 {
  margin-right: 12px;
}
.hl-label {
  color: #409eff;
}
.mt-2 {
  margin-top: 12px;
}
.el-date-editor.el-input {
  width: 0px;
}
.el-input--prefix .el-input__inner {
  visibility: hidden;
}
.history-component {
  max-height: 300px;
  overflow: auto;
}
</style>