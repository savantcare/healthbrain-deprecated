console.log('this will sync your table to your database')
console.log('and the console should read out Executing (default): CREATE TABLE IF NOT EXISTS "TABLE NAME"....')
db.sequelize.sync(function(err){});
