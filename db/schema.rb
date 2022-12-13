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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_152432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "base_whiistles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.integer "type"
    t.bigint "base_whiistle_id"
    t.integer "likes_count"
    t.integer "rewhiistles_count"
    t.integer "replies_count"
    t.integer "quoted_whiistles_count"
    t.index ["base_whiistle_id"], name: "index_base_whiistles_on_base_whiistle_id"
    t.index ["user_id"], name: "index_base_whiistles_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "whiistle_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["whiistle_id"], name: "index_likes_on_whiistle_id"
  end

  create_table "relations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "following_id", null: false
    t.bigint "followed_id", null: false
    t.index ["followed_id"], name: "index_relations_on_followed_id"
    t.index ["following_id"], name: "index_relations_on_following_id"
  end

  create_table "rewhiistles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "whiistle_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_rewhiistles_on_user_id"
    t.index ["whiistle_id"], name: "index_rewhiistles_on_whiistle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "fullname", null: false
    t.integer "whiistles_count"
    t.integer "followers_count"
    t.integer "followings_count"
    t.integer "rewhiistles_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "base_whiistles", "base_whiistles"
  add_foreign_key "base_whiistles", "users"
  add_foreign_key "likes", "base_whiistles", column: "whiistle_id"
  add_foreign_key "likes", "users"
  add_foreign_key "relations", "users", column: "followed_id"
  add_foreign_key "relations", "users", column: "following_id"
  add_foreign_key "rewhiistles", "base_whiistles", column: "whiistle_id"
  add_foreign_key "rewhiistles", "users"
end
