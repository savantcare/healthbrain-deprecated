## Work needed before declaring arch stable

Search 
   1. Highlight
   2. Tab

Code repeated between components.
   1. DB  
   2. KB traverse

Offline refresh needs to work

Style ID does not make sense

Code refactor

1. In https://github.com/savantcare/healthbrain/blob/62d857092560bb2770611fd9cbef4012adbca00d/vue-client/src/store/modules/recommendation.js#L181 section for "Server connection error" is missing. Why not call discontinueRecommendation() in a for loop from inside multidiscontinueRecommendation

Discontinue instead of edit

   1. This is a health app. Time travel (rollback) needs to work
   2. Remove updateRecommendation and updateReminders. Because if an exisitng data row is updated then time travel not possible.
   3. In the UI remove edit. Instead of edit it should be change. Change is discontinue the exisiting row and then add a new row.


## Questions

1. When I change R1 two rows are inserted R2 and R3.
All three are related by the field parentID.
R2 has two fields different from R1. These fields are discontinuedBy and discontinuedAt
R3 has the new description.
Can I avoid creating R2
