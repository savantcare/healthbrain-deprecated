<template>
  <div>
    <el-row :gutter="10">
      <el-col :span="6">
        <label>
          <span class="hl-label">B</span>iological Gender
        </label>
        <el-select
          v-model="biologicalGender"
          clearable
          placeholder="please select gender"
          :class="{'changed': changeStatus.biologicalGender != true}"
        >
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
          :class="{'changed': changeStatus.prefferedGender != true}"
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
        <date-picker
          @updateValidateChanges="updateValidateChanges"
          v-model="dateOfBirth"
          field="dateOfBirth"
        ></date-picker>
      </el-col>
    </el-row>
    <el-row class="mt-2" :gutter="10">
      <el-col :span="6">
        <label>
          <span>Bi</span>
          <span class="hl-label">r</span>
          th place
        </label>
        <input-box
          @updateValidateChanges="updateValidateChanges"
          v-model="birthPlace"
          placeholder="please input birthplace"
          field="birthPlace"
        ></input-box>
      </el-col>
      <el-col :span="6">
        <label>
          <span class="hl-label">L</span>ives with
        </label>
        <input-box
          @updateValidateChanges="updateValidateChanges"
          v-model="livesWith"
          placeholder="please input lives with"
          field="livesWith"
        ></input-box>
      </el-col>
      <el-col :span="6">
        <label>
          <span>Li</span>
          <span class="hl-label">v</span>es in
        </label>

        <input-box
          @updateValidateChanges="updateValidateChanges"
          v-model="livesIn"
          placeholder="please input lives in"
          field="livesIn"
        ></input-box>
      </el-col>
      <el-col :span="6">
        <label>
          #
          <span class="hl-label">o</span>f living children
        </label>
        <input-box
          @updateValidateChanges="updateValidateChanges"
          v-model="numberOfLivingChildren"
          placeholder="please input number of living children"
          field="numberOfLivingChildren"
        ></input-box>
      </el-col>
    </el-row>
    <el-row :gutter="10" class="mt-2">
      <el-col :span="8">
        <div>
          <label>
            <span class="hl-label">S</span>upports
          </label>
          <text-area
            v-model="supports"
            field="supports"
            @updateValidateChanges="updateValidateChanges"
          ></text-area>
        </div>
        <div class="mt-2">
          <label>Free text</label>
          <text-area
            v-model="freeText"
            field="freeText"
            @updateValidateChanges="updateValidateChanges"
          ></text-area>
        </div>
      </el-col>
      <el-col :span="8">
        <marital-history @updateValidateChanges="updateValidateChanges"></marital-history>
      </el-col>
      <el-col :span="8">
        <other-major-event @updateValidateChanges="updateValidateChanges"></other-major-event>
      </el-col>
    </el-row>
    <el-row :gutter="10" class="mt-2">
      <el-col :span="8">
        <development-history @updateValidateChanges="updateValidateChanges"></development-history>
      </el-col>
      <el-col :span="8" class="history-component">
        <education-history @updateValidateChanges="updateValidateChanges"></education-history>
      </el-col>
      <el-col :span="8" class="history-component">
        <employment-history @updateValidateChanges="updateValidateChanges"></employment-history>
      </el-col>
    </el-row>

    <el-row type="flex" justify="center" class="mt-2">
      <el-button type="primary" :disabled="validateChanges">Submit</el-button>
      <el-button type="primary" :disabled="validateChanges">Submit and exit</el-button>
    </el-row>
  </div>
</template>

<script>
import MaritalHistory from "./components/MaritalHistory.vue";
import DevelopmentHistory from "./components/DevelopmentHistory";
import MajorLifeEvent from "./components/MajorLifeEvent";
import EducationHistory from "./components/EducationHistory";
import EmploymentHistory from "./components/EmploymentHistory";

import DatePicker from "@/components/custom/DatePicker";
import InputBox from "@/components/custom/InputBox";
import TextArea from "@/components/custom/TextArea";
export default {
  components: {
    MaritalHistory,
    DevelopmentHistory,
    MajorLifeEvent,
    EducationHistory,
    EmploymentHistory,
    DatePicker,
    InputBox,
    TextArea
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
      birthPlace: "",
      livesWith: "",
      livesIn: "",
      numberOfLivingChildren: "",
      supports: "",
      freeText: "",

      changeStatus: {
        birthPlace: true,
        livesWith: true,
        livesIn: true,
        numberOfLivingChildren: true,
        biologicalGender: true,
        prefferedGender: true,
        dateOfBirth: true,
        supports: true,
        freeText: true,
        maritalHistory: true,
        otherMajorEvent: true,
        developmentHistory: true,
        educationHistory: true,
        employmentHistory: true
      }
    };
  },
  computed: {
    validateChanges() {
      let result = true;
      Object.keys(this.changeStatus).forEach(key => {
        if (this.changeStatus[key] != true) {
          result = false;
        }
      });
      return result;
    }
  },
  watch: {
    biologicalGender() {
      this.changeStatus.biologicalGender = false;
    },
    patientPreferredGender() {
      this.changeStatus.prefferedGender = false;
    }
  },
  methods: {
    updateValidateChanges(object) {
      const { field, value } = object;
      this.changeStatus[field] = value;
    }
  }
};
</script>

<style lang="scss">
.hl-label {
  color: #409eff;
}
.mt-2 {
  margin-top: 12px;
}
.el-date-editor.el-input {
  width: 0px;
}
.el-date-editor.el-input .el-input__inner {
  visibility: hidden;
}

.changed .el-input__inner,
.changed .el-textarea__inner {
  border-color: #e6a23c;
}
</style>