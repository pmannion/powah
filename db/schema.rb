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

ActiveRecord::Schema.define(version: 2018_11_01_162116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "petition_id", null: false
    t.integer "comment_id", null: false
    t.text "body", null: false
    t.integer "likes"
    t.string "user_display_name", null: false
    t.integer "user_id", null: false
    t.datetime "comment_created_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id", "petition_id"], name: "index_comments_on_comment_id_and_petition_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "petitions", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "petition_id", null: false
    t.string "name", null: false
    t.integer "total_signatures"
    t.integer "weekly_signatures"
    t.boolean "victory", default: false, null: false
    t.text "description", null: false
    t.string "petition_image_url"
    t.datetime "published_at", null: false
    t.string "created_by", null: false
    t.string "creator_image_url"
    t.boolean "status", null: false
    t.text "targets", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
  end

  create_table "search_terms", force: :cascade do |t|
    t.string "name", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
