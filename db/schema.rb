# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_27_064945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqs", force: :cascade do |t|
    t.string "faq_kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["work_experience_id"], name: "index_likes_on_work_experience_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "email", null: false
    t.text "body", null: false
    t.bigint "faq_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faq_id"], name: "index_questions_on_faq_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 15, null: false
    t.string "email", null: false
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "password_digest", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "work_experience_coments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.bigint "work_experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_experience_coments_on_user_id"
    t.index ["work_experience_id"], name: "index_work_experience_coments_on_work_experience_id"
  end

  create_table "work_experience_comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.bigint "work_experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_experience_comments_on_user_id"
    t.index ["work_experience_id"], name: "index_work_experience_comments_on_work_experience_id"
  end

  create_table "work_experience_looked_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_experience_looked_histories_on_user_id"
    t.index ["work_experience_id"], name: "index_work_experience_looked_histories_on_work_experience_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "title", limit: 35, null: false
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_work_experiences_on_title"
    t.index ["user_id"], name: "index_work_experiences_on_user_id"
  end

  add_foreign_key "likes", "users"
  add_foreign_key "likes", "work_experiences"
  add_foreign_key "questions", "faqs"
  add_foreign_key "work_experience_coments", "users"
  add_foreign_key "work_experience_coments", "work_experiences"
  add_foreign_key "work_experience_comments", "users"
  add_foreign_key "work_experience_comments", "work_experiences"
  add_foreign_key "work_experience_looked_histories", "users"
  add_foreign_key "work_experience_looked_histories", "work_experiences"
  add_foreign_key "work_experiences", "users"
end
