module.exports = (sequelize, Sequelize) => {
  const Recommendation = sequelize.define("recommendation", {
    id: {
      type: Sequelize.STRING,
      primaryKey: true
    },
    description: {
      type: Sequelize.STRING
    },
    discontinue: {
      type: Sequelize.BOOLEAN
    },
    patientId: {
      type: Sequelize.DECIMAL
    },
    // Timestamps
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
    discontinueAt: Sequelize.DATE
  });

  return Recommendation;
};
