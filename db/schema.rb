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

ActiveRecord::Schema.define(version: 20170417082732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_publishers", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id",   null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",                limit: 255, null: false
    t.integer  "publisher_id",                     null: false
    t.datetime "published_at"
    t.string   "isbn",                 limit: 13
    t.text     "blurb"
    t.integer  "page_count"
    t.float    "price"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "cover_image"
    t.string   "name"
    t.string   "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_foreign_key "authors_books", "authors", name: "fk_bk_authors", on_delete: :cascade
  add_foreign_key "authors_books", "books", name: "fk_bk_books", on_delete: :cascade
  add_foreign_key "books", "admin_publishers", column: "publisher_id", name: "fk_books_bublishers", on_delete: :cascade
end
