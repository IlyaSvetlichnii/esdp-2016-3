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

ActiveRecord::Schema.define(version: 20161201150040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.boolean  "is_correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "homework_answers", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_correct"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "homework_question_id"
    t.index ["homework_question_id"], name: "index_homework_answers_on_homework_question_id", using: :btree
  end

  create_table "homework_assignments", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "homework_id"
    t.integer  "homework_status_id"
    t.index ["homework_id"], name: "index_homework_assignments_on_homework_id", using: :btree
    t.index ["homework_status_id"], name: "index_homework_assignments_on_homework_status_id", using: :btree
    t.index ["user_id"], name: "index_homework_assignments_on_user_id", using: :btree
  end

  create_table "homework_files", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "homework_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["homework_id"], name: "index_homework_files_on_homework_id", using: :btree
  end

  create_table "homework_questions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "homework_id"
    t.index ["homework_id"], name: "index_homework_questions_on_homework_id", using: :btree
  end

  create_table "homework_results", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "homework_assignment_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "test_result"
    t.text     "description"
    t.index ["homework_assignment_id"], name: "index_homework_results_on_homework_assignment_id", using: :btree
  end

  create_table "homework_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_deleted"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "type_homework"
    t.index ["user_id"], name: "index_homeworks_on_user_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.date     "day_of_week"
    t.string   "time"
    t.string   "student_name"
    t.string   "student_id"
    t.string   "teacher_name"
    t.string   "teacher_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "teacher_time_id"
    t.index ["teacher_time_id"], name: "index_lessons_on_teacher_time_id", using: :btree
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "library_files", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "literature_file_name"
    t.string   "literature_content_type"
    t.integer  "literature_file_size"
    t.datetime "literature_updated_at"
    t.string   "path_file"
    t.index ["user_id"], name: "index_library_files_on_user_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_answers", force: :cascade do |t|
    t.text     "answer"
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_profile_answers_on_user_id", using: :btree
  end

  create_table "profile_questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "level_id"
    t.index ["level_id"], name: "index_questions_on_level_id", using: :btree
  end

  create_table "status_time_teachers", force: :cascade do |t|
    t.string   "status_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teacher_times", force: :cascade do |t|
    t.string   "time"
    t.string   "day_of_week"
    t.string   "student_id"
    t.string   "teacher_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status_time_teacher_id"
    t.index ["status_time_teacher_id"], name: "index_teacher_times_on_status_time_teacher_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "skype"
    t.string   "phone"
    t.string   "teacher_id"
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "position_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "status"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["position_id"], name: "index_users_on_position_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "homework_answers", "homework_questions"
  add_foreign_key "homework_assignments", "homework_statuses"
  add_foreign_key "homework_assignments", "homeworks"
  add_foreign_key "homework_assignments", "users"
  add_foreign_key "homework_files", "homeworks"
  add_foreign_key "homework_questions", "homeworks"
  add_foreign_key "homework_results", "homework_assignments"
  add_foreign_key "homeworks", "users"
  add_foreign_key "lessons", "teacher_times"
  add_foreign_key "library_files", "users"
  add_foreign_key "profile_answers", "users"
  add_foreign_key "questions", "levels"
  add_foreign_key "teacher_times", "status_time_teachers"
  add_foreign_key "users", "positions"
end
