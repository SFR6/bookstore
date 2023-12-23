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

ActiveRecord::Schema[7.1].define(version: 2023_12_22_191946) do
  create_table "authors", primary_key: "author_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "nationality", limit: 45, null: false
    t.index ["author_id"], name: "author_id_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "books", primary_key: "book_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.decimal "price", precision: 53, scale: 2, null: false
    t.integer "author_id", null: false
    t.integer "genre_id", null: false
    t.index ["author_id"], name: "author_id"
    t.index ["book_id"], name: "book_id_UNIQUE", unique: true
    t.index ["genre_id"], name: "genre_id_idx"
  end

  create_table "customers", primary_key: "customer_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "phone_number", limit: 15
    t.index ["customer_id"], name: "customer_id_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "database_structures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", primary_key: "employee_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "age", null: false
    t.string "phone_number", limit: 25, null: false
    t.index ["employee_id"], name: "employee_id_UNIQUE", unique: true
    t.index ["name"], name: "name_UNIQUE", unique: true
    t.check_constraint "(`age` > 15) and (`age` < 71)", name: "employees_chk_1"
  end

  create_table "genres", primary_key: "genre_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "genre_name", limit: 50, null: false
    t.index ["genre_id"], name: "genre_id_UNIQUE", unique: true
    t.index ["genre_name"], name: "genre_name_UNIQUE", unique: true
  end

  create_table "orders", primary_key: "order_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "payment_method_id", null: false
    t.integer "employee_id", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "customer_id_idx"
    t.index ["employee_id"], name: "employee_id_idx"
    t.index ["order_id"], name: "order_id_UNIQUE", unique: true
    t.index ["payment_method_id"], name: "payment_method_id_idx"
  end

  create_table "ordersdetails", primary_key: "ordersDetails_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "book_id_idx"
    t.index ["order_id"], name: "order_id_idx"
    t.index ["ordersDetails_id"], name: "ordersDetails_id_UNIQUE", unique: true
  end

  create_table "paymentmethods", primary_key: "paymentMethod_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 15, null: false
    t.index ["name"], name: "name_UNIQUE", unique: true
    t.index ["paymentMethod_id"], name: "paymentMethod_id_UNIQUE", unique: true
  end

  create_table "ratings", primary_key: "review_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "comments", limit: 500
    t.integer "number_of_stars", null: false
    t.index ["book_id"], name: "book_id_idx"
    t.index ["review_id"], name: "review_id_UNIQUE", unique: true
    t.check_constraint "(`number_of_stars` > 0) and (`number_of_stars` < 6)", name: "ratings_chk_1"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
