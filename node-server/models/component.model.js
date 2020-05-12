module.exports = (sequelize, Sequelize) => {
  const Component = sequelize.define("component", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    type: { // 1: health-component, 2: other-component
      type: Sequelize.INTEGER
    },
    name: {
      type: Sequelize.STRING
    },
    // Timestamps
    createdAt: Sequelize.DATE,
    updatedAt: Sequelize.DATE,
  });

  return Component;
};
