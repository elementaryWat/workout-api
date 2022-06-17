const { prisma } = require("../database.js");
const { Query } = require("./query.js");
const { Mutation } = require("./mutation.js");

const Category = {
  id: (parent, args, context, info) => parent.id,
  name: (parent) => parent.name,
  exercises: (parent, args) => {
    return prisma.category.findUnique({ where: { id: parent.id } })
      .exercises()
  },
};

const Exercise = {
  id: (parent) => parent.id,
  name: (parent) => parent.name,
  url: (parent) => parent.url,
  category: (parent, args) => {
    return prisma.exercise.findUnique({
      where: { id: parent.id },
    }).category();
  },
  set: (parent, args) => {
    return prisma.set.findFirst({
      where: { id: parent.set },
    });
  },
};


const resolvers = {
  Category,
  Exercise,
  Query,
  Mutation,
};

module.exports = {
  resolvers,
};