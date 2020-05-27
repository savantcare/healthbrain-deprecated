<template>
  <div>
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
        <el-select v-model="patientPreferredGender" clearable placeholder="please select gender">
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
        <date-picker v-model="dateOfBirth"></date-picker>
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
        <div>
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
        </div>
        <div class="mt-2">
          <label>Free text</label>
          <el-input
            type="textarea"
            :autosize="{ minRows: 2, maxRows: 4}"
            placeholder="Please input"
            v-model="supports"
            clearable
          />
        </div>
      </el-col>
      <el-col :span="8">
        <marital-history></marital-history>
      </el-col>
      <el-col :span="8">
        <other-major-event></other-major-event>
      </el-col>
    </el-row>
    <el-row :gutter="10" class="mt-2">
      <el-col :span="8">
        <development-history></development-history>
      </el-col>
      <el-col :span="8" class="history-component">
        <education-history></education-history>
      </el-col>
      <el-col :span="8" class="history-component">
        <employment-history></employment-history>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import MaritalHistory from "./components/MaritalHistory.vue";
import DevelopmentHistory from "./components/DevelopmentHistory";
import OtherMajorEvent from "./components/OtherMajorEvent";
import EducationHistory from "./components/EducationHistory";
import EmploymentHistory from "./components/EmploymentHistory";

import DatePicker from "@/components/custom/DatePicker";
export default {
  components: {
    MaritalHistory,
    DevelopmentHistory,
    OtherMajorEvent,
    EducationHistory,
    EmploymentHistory,
    DatePicker
  },
  data() {
    return {
      visibility: true,
      title: "Social history",
      editableTabsValue: "1",
      editableTabs: [
        {
          title: "Tab 1",
          name: "1",
          content: "Tab 1 content"
        }
      ],
      tabIndex: 1,
      lastViewDate: "Jan 15th 20",
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

<style lang="scss" scope>
.el-date-editor.el-input {
  width: 0px;
}
.el-input--prefix .el-input__inner {
  visibility: hidden;
}
</style>