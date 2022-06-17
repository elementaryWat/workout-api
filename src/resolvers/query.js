const { prisma } = require("../database.js");

const Query = {
    categories: (parent, args) => {
      return prisma.category.findMany({
        include: { 
          exercises: true
        },
      });
    },

    exercises: (parent, args) => {
      return prisma.exercise.findMany({});
    },

    exercise: (parent, args) => {
      return prisma.exercise.findFirst({
        where: { id: Number(args.id) },
      });
    },

    workouts: (parent, args) => {
      return prisma.workout.findMany({});
    },

    workout: (parent, args) => {
      return prisma.course.findFirst({
        where: { id: Number(args.id) },
      });
    },
  };

  module.exports = {
    Query,
  }