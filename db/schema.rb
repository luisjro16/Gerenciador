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

ActiveRecord::Schema[7.2].define(version: 2024_08_21_012728) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "code"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "cep"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.index ["department_id", "user_id"], name: "index_departments_users_on_department_id_and_user_id"
    t.index ["user_id", "department_id"], name: "index_departments_users_on_user_id_and_department_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.date "birth_date"
    t.string "gender"
    t.string "cpf"
    t.string "rg"
    t.text "adress"
    t.string "phone"
    t.string "email"
    t.date "hire_date"
    t.decimal "salary"
    t.string "status"
    t.integer "cep"
    t.string "country"
    t.string "city"
    t.string "district"
    t.integer "number"
    t.string "complement"
    t.boolean "terms"
    t.integer "department_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "level"
    t.decimal "base_salary"
    t.text "requirements"
    t.text "benefits"
    t.string "status"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "access_level"
    t.integer "department_ids"
    t.boolean "must_change_password"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
