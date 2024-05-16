# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_07_002712) do
  create_table "cooking_time", force: :cascade do |t|
    t.integer "cooking_time", limit: 3
  end

  create_table "cooking_times", force: :cascade do |t|
    t.string "cooking_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "create_tests", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
    t.integer "taste_id"
    t.integer "cooking_time_id"
  end

  create_table "dish_test", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
  end

  create_table "dish_test2", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
  end

  create_table "dish_test3", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
    t.integer "taste_id"
    t.integer "cooking_time_id"
  end

  create_table "dish_test4", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
    t.integer "taste_id"
    t.integer "cooking_time_id"
  end

  create_table "dish_test5", force: :cascade do |t|
    t.string "name", limit: 15
    t.string "picture_path", limit: 100
    t.string "recipe", limit: 1000
    t.integer "genre_id"
    t.integer "taste_id"
    t.integer "cooking_time_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "picture_path"
    t.string "varchar"
    t.string "recipe"
    t.integer "genre_id", null: false
    t.integer "taste_id", null: false
    t.integer "cooking_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooking_time_id"], name: "index_dishes_on_cooking_time_id"
    t.index ["genre_id"], name: "index_dishes_on_genre_id"
    t.index ["taste_id"], name: "index_dishes_on_taste_id"
  end

  create_table "genre", force: :cascade do |t|
    t.string "genre", limit: 10
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taste", force: :cascade do |t|
    t.string "taste", limit: 10
  end

  create_table "tastes", force: :cascade do |t|
    t.string "taste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "test" because of following StandardError
#   Unknown type '' for column 'id'

  add_foreign_key "dish", "cooking_time"
  add_foreign_key "dish", "genre"
  add_foreign_key "dish", "taste"
  add_foreign_key "dish_test2", "genre"
  add_foreign_key "dish_test3", "genre"
  add_foreign_key "dish_test4", "genre"
  add_foreign_key "dish_test4", "taste"
  add_foreign_key "dish_test5", "genre"
  add_foreign_key "dish_test5", "taste"
  add_foreign_key "dishes", "cooking_times"
  add_foreign_key "dishes", "genres"
  add_foreign_key "dishes", "tastes"
end
