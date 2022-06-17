const { gql } = require("apollo-server")

const typeDefs = gql `

 type Category {
    id: ID!
    name: String!
    exercises: [Exercise]
  }

  type Exercise {
    id: ID!
    name: String!
    url: String
    category: Category
    set: Set
  }

  type Set {
    id: ID!
    exercise: Exercise
    reps: Int
    time: Int
    weight: Int
    rpe: Int
    batch: Batch
  }

  type Batch {
    id: ID!
    sets: [Set]
    workout: Workout
  }

  type Workout {
    id: ID!
    name: String!
    batches: [Batch]
    updatedAt: String
    createdAt: String
  }

  input CategoryCreateInput {
    name: String!
    exercises: [ExerciseCreateInput]
  }

  input ExerciseCreateInput {
    name: String!
    url:  String,
    category: ID
  }

  type Query {
    categories: [Category]
    exercises: [Exercise]
    exercise(id: ID!): Exercise
    workouts: [Workout]
    workout(id: ID!): Workout
  }

  type Mutation {
    createCategory(data: CategoryCreateInput!): Category!
    createExercise(name: String!, url: String, categoryId: ID): Exercise!
    deleteExercise(id: ID!): Exercise!
  }
`

module.exports = {
    typeDefs,
  }