(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["home"],{"129f":function(e,t){e.exports=Object.is||function(e,t){return e===t?0!==e||1/e===1/t:e!=e&&t!=t}},"5ced":function(e,t,n){},"841c":function(e,t,n){"use strict";var i=n("d784"),o=n("825a"),s=n("1d80"),r=n("129f"),a=n("14c3");i("search",1,(function(e,t,n){return[function(t){var n=s(this),i=void 0==t?void 0:t[e];return void 0!==i?i.call(t,n):new RegExp(t)[e](String(n))},function(e){var i=n(t,e,this);if(i.done)return i.value;var s=o(e),c=String(this),h=s.lastIndex;r(h,0)||(s.lastIndex=0);var d=a(s,c);return r(s.lastIndex,h)||(s.lastIndex=h),null===d?-1:d.index}]}))},bb51:function(e,t,n){"use strict";n.r(t);var i=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",[n("Split",{staticStyle:{height:"100vh"},on:{onDrag:e.onDrag}},[n("SplitArea",{attrs:{size:70,minsize:100,id:"leftPanel"}},[n("left-panel-header")],1),n("SplitArea",{attrs:{size:30,minsize:100}},[n("search-box",{ref:"search_box",on:{renderRightPanel:e.renderRightPanel}})],1)],1)],1)},o=[];n("4160"),n("d3b7"),n("ac1f"),n("841c"),n("1276"),n("159b");Promise.all([n.e("chunk-10324722"),n.e("chunk-2d20edb2")]).then(n.bind(null,"b0c1")),Promise.all([n.e("chunk-10324722"),n.e("chunk-2d230e36")]).then(n.bind(null,"edcd")),n.e("chunk-2d0c4df8").then(n.bind(null,"3d4e"));var s=function(){return n.e("chunk-071a7197").then(n.bind(null,"6bc6"))},r=function(){return n.e("chunk-6f07a559").then(n.bind(null,"17ba"))},a=function(){return Promise.all([n.e("chunk-10324722"),n.e("chunk-6c2d573c")]).then(n.bind(null,"b4f8"))},c=function(){return Promise.all([n.e("chunk-10324722"),n.e("chunk-2cda9022")]).then(n.bind(null,"4981"))},h={name:"Home",components:{LeftPanelHeader:s,SearchBox:r},data:function(){return{searchKeyword:"",leftPanelWidth:70}},computed:{focusComponent:function(){return this.$store.state.focusComponent},rightPanelComponents:function(){return this.$store.state.rightPanel.list},leftPanelComponents:function(){return this.$store.getters.leftPanelList}},beforeCreate:function(){},mounted:function(){window.addEventListener("keydown",this.keydownHandler),this.$store.commit("setFocusComponent",""),this.$store.commit("setRightPanelFocusRowIndex",-1)},methods:{onDrag:function(e){var t=e[1];this.$store.commit("setRightPanelWidth","calc(".concat(t,"% - 4px) ")),this.leftPanelWidth=e[0]},keydownHandler:function(e){var t=this.$store.state.rightPanel.focusRowIndex,n=this.$store.state.rightPanel,i=n.rows,o=n.searchKeyword;if(!(o.length>0)){"`"==e.key?(t=i.length-1,this.$refs.search_box.setFocus(),this.$store.commit("setRightPanelFocusRowIndex",t)):"ArrowDown"==e.key?(t==i.length-1?t=0:t+=1,this.$store.commit("setRightPanelFocusRowIndex",t)):"ArrowUp"==e.key&&(0==t?t=i.length-1:t-=1,this.$store.commit("setRightPanelFocusRowIndex",t));var s=i[t];if(null!=s){var r=s.split("-"),a=r[0],c=r[1],h=this.$store.state.tabDialog.visibility;if(1!=h)if(c>0){if("c"==e.key){if("recommendation"==a){var d=this.$store.getters.recommendations,l=d[c-1];this.$store.commit("showEditRecommendationsModal",l)}else if("reminder"==a){var u=this.$store.getters.reminders,m=u[c-1];this.$store.commit("showEditReminderModal",m)}}else if("d"==e.key){if("recommendation"==a){var f=this.$store.getters.recommendations,g=f[c-1];this.$store.dispatch("discontinueRecommendation",{data:g,toast:this.$bvToast})}else if("reminder"==a){var w=this.$store.getters.reminders,p=w[c-1];this.$store.dispatch("discontinueReminder",{data:p,toast:this.$bvToast})}this.updateRightPanelRows()}}else"a"==e.key?"recommendation"==a?this.$store.commit("showAddRecommendationModal"):"reminder"==a&&this.$store.commit("showAddReminderModal"):"m"==e.key&&("recommendation"==a?this.$store.commit("showMultiChangeRecommendationModal"):"reminder"==a&&this.$store.commit("showMultiChangeReminderModal"))}}},renderRightPanel:function(e){if("clear"==e)this.$store.commit("setRightPanelList",[]);else if(e.search("recommendation")>-1){var t=[];this.rightPanelComponents.forEach((function(e){"recommendation"!=e.key&&t.push(e)})),t.push({key:"recommendation",value:a}),this.$store.commit("setRightPanelList",t)}else if(e.search("reminder")>-1){var n=[];this.rightPanelComponents.forEach((function(e){"reminder"!=e.key&&n.push(e)})),n.push({key:"reminder",value:c}),this.$store.commit("setRightPanelList",n)}this.updateRightPanelRows()},updateRightPanelRows:function(){this.$store.dispatch("updateRightPanelRow")}},beforeDestroy:function(){window.removeEventListener("keydown",this.keydownHandler)}},d=h,l=(n("cccb"),n("2877")),u=Object(l["a"])(d,i,o,!1,null,null,null);t["default"]=u.exports},cccb:function(e,t,n){"use strict";var i=n("5ced"),o=n.n(i);o.a}}]);
//# sourceMappingURL=home.3405e4e4.js.map