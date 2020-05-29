/*
How to model a table?
https://sequelize.org/v5/manual/getting-started.html#modeling-a-table

id is string since we do not want it to be a auto incrementing integer.
*/

module.exports = (sequelize, Sequelize) => {
  const Recommendation = sequelize.define("recommendation", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    recommendationID: {
      type: Sequelize.STRING
    },
    description: {
      type: Sequelize.STRING
    },
    discontinue: {
      type: Sequelize.BOOLEAN,
      defaultValue: 0
    },
    patientId: {
      type: Sequelize.STRING
    },
    createdByUserId: {
      type: Sequelize.STRING
    },
    discontinuedByUserId: {
      type: Sequelize.STRING
    },
    // Timestamps
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
    discontinueAt: Sequelize.DATE
  });

  return Recommendation;
};
