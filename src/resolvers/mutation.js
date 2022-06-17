const { prisma } = require("../database.js");

const Mutation = {
    createCategory: (parent, args) => {
      return prisma.category.create({
        data: {
          name: args.data.name,
          exercises: args.data.exercises && {
            create: args.data.exercises,
          }
        },
      });
    },

    createExercise: (parent, args) => {
      return prisma.exercise.create({
        data: {
          name: args.name,
          url: args.url || "",
          category: args.categoryId && {
            connect: { id: Number(args.categoryId) },
          },
        },
      });
    },

    deleteExercise: (parent, args) => {
      return prisma.exercise.delete({
        where: { id: Number(args.id) }
      });
    },
  };

  module.exports = {
    Mutation,
  }