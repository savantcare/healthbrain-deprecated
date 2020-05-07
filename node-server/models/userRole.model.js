module.exports = (sequelize, Sequelize) => {
  const UserRole = sequelize.define("user_role", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: Sequelize.STRING
    },
    availableComponents: {
      type: Sequelize.STRING
    },
    // Timestamps
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE
  });

  UserRole.associate = function (models) {
    UserRole.hasMany(models.user, { as: 'users' })
  };

  return UserRole;
};
