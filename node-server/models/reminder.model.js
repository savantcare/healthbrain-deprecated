module.exports = (sequelize, Sequelize) => {
  const Reminder = sequelize.define("reminder", {
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

  return Reminder;
};
