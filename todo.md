## Work needed before declaring arch stable

A. Code repeated between components.
   1. DB  
   2. KB traverse

B. Seperate repo but 1 app for each component.

C. Search 
   1. Highlight the search term in each row of the result.
   2. Press enter to select highlighted row.
   3. "rex " to execute the first command in the card header.

D. Offline refresh needs to work

E. Style ID does not make sense

F. Code refactor

   1. https://github.com/savantcare/healthbrain/blob/62d857092560bb2770611fd9cbef4012adbca00d/vue-client/src/store/modules/recommendation.js#L181 section for "Server connection error" is missing. Why not call discontinueRecommendation() in a for loop from inside multidiscontinueRecommendation (@jana)

G. Discontinue instead of edit

   1. This is a health app. Time travel (rollback) needs to work (@raj)

      A. Remove updateRecommendation and updateReminders. Because if an exisitng data row is updated then time travel not possible.
      
      B. In the UI remove edit. Instead of edit it should be change. Change is discontinue the exisiting row and then add a new row.


## Questions

1. When I change R1 two rows are inserted R2 and R3.
All three are related by the field parentID.
R2 has two fields different from R1. These fields are discontinuedBy and discontinuedAt
R3 has the new description.
Can I avoid creating R2 by updating the value of discontinuedBy and discontinuedAt in R1.
Currect choice: Update the 2 fields in R1 when a row is discontinued.