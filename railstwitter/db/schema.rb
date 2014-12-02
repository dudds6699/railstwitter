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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141202010308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "countries", primary_key: "gid", force: true do |t|
    t.integer "scalerank",  limit: 2
    t.string  "featurecla", limit: 30
    t.float   "labelrank"
    t.string  "sovereignt", limit: 32
    t.string  "sov_a3",     limit: 3
    t.float   "adm0_dif"
    t.float   "level"
    t.string  "type",       limit: 17
    t.string  "admin",      limit: 40
    t.string  "adm0_a3",    limit: 3
    t.float   "geou_dif"
    t.string  "geounit",    limit: 40
    t.string  "gu_a3",      limit: 3
    t.float   "su_dif"
    t.string  "subunit",    limit: 40
    t.string  "su_a3",      limit: 3
    t.float   "brk_diff"
    t.string  "name",       limit: 36
    t.string  "name_long",  limit: 40
    t.string  "brk_a3",     limit: 3
    t.string  "brk_name",   limit: 36
    t.string  "brk_group",  limit: 30
    t.string  "abbrev",     limit: 13
    t.string  "postal",     limit: 4
    t.string  "formal_en",  limit: 52
    t.string  "formal_fr",  limit: 35
    t.string  "note_adm0",  limit: 22
    t.string  "note_brk",   limit: 164
    t.string  "name_sort",  limit: 36
    t.string  "name_alt",   limit: 38
    t.float   "mapcolor7"
    t.float   "mapcolor8"
    t.float   "mapcolor9"
    t.float   "mapcolor13"
    t.float   "pop_est"
    t.float   "gdp_md_est"
    t.float   "pop_year"
    t.float   "lastcensus"
    t.float   "gdp_year"
    t.string  "economy",    limit: 26
    t.string  "income_grp", limit: 23
    t.float   "wikipedia"
    t.string  "fips_10_",   limit: 3
    t.string  "iso_a2",     limit: 5
    t.string  "iso_a3",     limit: 3
    t.string  "iso_n3",     limit: 3
    t.string  "un_a3",      limit: 4
    t.string  "wb_a2",      limit: 3
    t.string  "wb_a3",      limit: 3
    t.float   "woe_id"
    t.float   "woe_id_eh"
    t.string  "woe_note",   limit: 190
    t.string  "adm0_a3_is", limit: 3
    t.string  "adm0_a3_us", limit: 3
    t.float   "adm0_a3_un"
    t.float   "adm0_a3_wb"
    t.string  "continent",  limit: 23
    t.string  "region_un",  limit: 23
    t.string  "subregion",  limit: 25
    t.string  "region_wb",  limit: 26
    t.float   "name_len"
    t.float   "long_len"
    t.float   "abbrev_len"
    t.float   "tiny"
    t.float   "homepart"
    t.spatial "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  create_table "tweets", force: true do |t|
    t.string   "twitterID"
    t.string   "tweetID"
    t.string   "username"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "coords",     limit: {:srid=>4326, :type=>"point"}
    t.string   "tweettext"
  end

end
