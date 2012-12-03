# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121203025237) do

  create_table "calls", :force => true do |t|
    t.string   "title"
    t.date     "opening"
    t.date     "close"
    t.text     "profile"
    t.text     "work"
    t.integer  "hours_week"
    t.integer  "hours_total"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sort"
  end

  create_table "dependences", :force => true do |t|
    t.string   "name"
    t.text     "mision"
    t.text     "vision"
    t.text     "information"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "eventos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "faber_giraldos", :force => true do |t|
    t.string   "nombre"
    t.integer  "edad"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "login_registers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "messages", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.string   "subject"
    t.text     "content"
    t.integer  "dependence_id"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "student"
    t.boolean  "teacher"
    t.boolean  "admin"
    t.date     "validity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dependence_id"
  end

  create_table "private_messages", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "firtname"
    t.string   "secondname"
    t.string   "code"
    t.string   "email"
    t.string   "rol"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dependence_id"
  end

end
