module.exports = (sequelize, Sequelize) => {
  const Reminder = sequelize.define("reminder", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    reminderID: {
      type: Sequelize.STRING
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
    createdByUserId: {
      type: Sequelize.DECIMAL
    },
    discontinuedByUserId: {
      type: Sequelize.DECIMAL
    },
    // Timestamps
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
    discontinueAt: Sequelize.DATE
  });

  return Reminder;
};
