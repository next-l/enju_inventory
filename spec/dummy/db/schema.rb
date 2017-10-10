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

ActiveRecord::Schema.define(version: 20170114174536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "accepts", id: :serial, force: :cascade do |t|
    t.integer "basket_id"
    t.uuid "item_id"
    t.integer "librarian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_accepts_on_basket_id"
    t.index ["item_id"], name: "index_accepts_on_item_id"
  end

  create_table "agent_import_file_transitions", force: :cascade do |t|
    t.string "to_state"
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "agent_import_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["agent_import_file_id"], name: "index_agent_import_file_transitions_on_agent_import_file_id"
    t.index ["sort_key", "agent_import_file_id"], name: "index_agent_import_file_transitions_on_sort_key_and_file_id", unique: true
  end

  create_table "agent_import_files", force: :cascade do |t|
    t.integer "parent_id"
    t.string "content_type"
    t.integer "size"
    t.integer "user_id"
    t.text "note"
    t.datetime "executed_at"
    t.string "agent_import_file_name"
    t.string "agent_import_content_type"
    t.integer "agent_import_size"
    t.datetime "agent_import_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent_import_fingerprint"
    t.text "error_message"
    t.string "edit_mode"
    t.string "user_encoding"
    t.string "agent_import_id"
    t.jsonb "attachment_data"
    t.index ["agent_import_id"], name: "index_agent_import_files_on_agent_import_id"
    t.index ["parent_id"], name: "index_agent_import_files_on_parent_id"
    t.index ["user_id"], name: "index_agent_import_files_on_user_id"
  end

  create_table "agent_import_results", force: :cascade do |t|
    t.integer "agent_import_file_id"
    t.integer "agent_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_merge_lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_merges", force: :cascade do |t|
    t.integer "agent_id", null: false
    t.integer "agent_merge_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_merges_on_agent_id"
    t.index ["agent_merge_list_id"], name: "index_agent_merges_on_agent_merge_list_id"
  end

  create_table "agent_names", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "full_name"
    t.bigint "language_id"
    t.bigint "agent_id"
    t.bigint "profile_id"
    t.integer "position"
    t.string "source"
    t.string "name_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_names_on_agent_id"
    t.index ["full_name"], name: "index_agent_names_on_full_name"
    t.index ["language_id"], name: "index_agent_names_on_language_id"
    t.index ["profile_id"], name: "index_agent_names_on_profile_id"
  end

  create_table "agent_relationship_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_relationships", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.integer "agent_relationship_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["child_id"], name: "index_agent_relationships_on_child_id"
    t.index ["parent_id"], name: "index_agent_relationships_on_parent_id"
  end

  create_table "agent_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "last_name"
    t.string "middle_name"
    t.string "first_name"
    t.string "last_name_transcription"
    t.string "middle_name_transcription"
    t.string "first_name_transcription"
    t.string "corporate_name"
    t.string "corporate_name_transcription"
    t.string "full_name"
    t.text "full_name_transcription"
    t.text "full_name_alternative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "zip_code_1"
    t.string "zip_code_2"
    t.text "address_1"
    t.text "address_2"
    t.text "address_1_note"
    t.text "address_2_note"
    t.string "telephone_number_1"
    t.string "telephone_number_2"
    t.string "fax_number_1"
    t.string "fax_number_2"
    t.text "other_designation"
    t.text "place"
    t.string "postal_code"
    t.text "street"
    t.text "locality"
    t.text "region"
    t.datetime "date_of_birth"
    t.datetime "date_of_death"
    t.integer "language_id", default: 1, null: false
    t.integer "country_id", default: 1, null: false
    t.integer "agent_type_id", default: 1, null: false
    t.integer "lock_version", default: 0, null: false
    t.text "note"
    t.integer "required_role_id", default: 1, null: false
    t.integer "required_score", default: 0, null: false
    t.text "email"
    t.text "url"
    t.text "full_name_alternative_transcription"
    t.string "birth_date"
    t.string "death_date"
    t.string "agent_identifier"
    t.integer "profile_id"
    t.index ["agent_identifier"], name: "index_agents_on_agent_identifier"
    t.index ["country_id"], name: "index_agents_on_country_id"
    t.index ["full_name"], name: "index_agents_on_full_name"
    t.index ["language_id"], name: "index_agents_on_language_id"
    t.index ["profile_id"], name: "index_agents_on_profile_id"
    t.index ["required_role_id"], name: "index_agents_on_required_role_id"
  end

  create_table "baskets", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "note"
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "bookstores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "zip_code"
    t.text "address"
    t.text "note"
    t.string "telephone_number"
    t.string "fax_number"
    t.string "url"
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_types", force: :cascade do |t|
    t.string "name"
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carrier_type_has_checkout_types", force: :cascade do |t|
    t.bigint "carrier_type_id", null: false
    t.bigint "checkout_type_id", null: false
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_type_id"], name: "index_carrier_type_has_checkout_types_on_carrier_type_id"
    t.index ["checkout_type_id"], name: "index_carrier_type_has_checkout_types_on_checkout_type_id"
  end

  create_table "carrier_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_id"
    t.string "attachment_filename"
    t.integer "attachment_size"
    t.string "attachment_content_type"
    t.jsonb "attachment_data"
  end

  create_table "checked_items", id: :serial, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.integer "basket_id", null: false
    t.datetime "due_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "librarian_id"
    t.index ["basket_id"], name: "index_checked_items_on_basket_id"
    t.index ["item_id"], name: "index_checked_items_on_item_id"
  end

  create_table "checkins", id: :serial, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.integer "librarian_id", null: false
    t.integer "basket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version", default: 0, null: false
    t.index ["basket_id"], name: "index_checkins_on_basket_id"
    t.index ["item_id"], name: "index_checkins_on_item_id"
    t.index ["librarian_id"], name: "index_checkins_on_librarian_id"
  end

  create_table "checkout_stat_has_manifestations", force: :cascade do |t|
    t.integer "manifestation_checkout_stat_id", null: false
    t.integer "manifestation_id", null: false
    t.integer "checkouts_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manifestation_checkout_stat_id"], name: "index_checkout_stat_has_manifestations_on_checkout_stat_id"
    t.index ["manifestation_id"], name: "index_checkout_stat_has_manifestations_on_manifestation_id"
  end

  create_table "checkout_stat_has_users", force: :cascade do |t|
    t.integer "user_checkout_stat_id", null: false
    t.integer "user_id", null: false
    t.integer "checkouts_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_checkout_stat_id"], name: "index_checkout_stat_has_users_on_user_checkout_stat_id"
    t.index ["user_id"], name: "index_checkout_stat_has_users_on_user_id"
  end

  create_table "checkout_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_checkout_types_on_name", unique: true
  end

  create_table "checkouts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.uuid "item_id", null: false
    t.integer "checkin_id"
    t.integer "librarian_id"
    t.integer "basket_id"
    t.datetime "due_date"
    t.integer "checkout_renewal_count", default: 0, null: false
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shelf_id"
    t.integer "library_id"
    t.index ["basket_id"], name: "index_checkouts_on_basket_id"
    t.index ["checkin_id"], name: "index_checkouts_on_checkin_id"
    t.index ["item_id", "basket_id"], name: "index_checkouts_on_item_id_and_basket_id", unique: true
    t.index ["item_id"], name: "index_checkouts_on_item_id"
    t.index ["librarian_id"], name: "index_checkouts_on_librarian_id"
    t.index ["library_id"], name: "index_checkouts_on_library_id"
    t.index ["shelf_id"], name: "index_checkouts_on_shelf_id"
    t.index ["user_id"], name: "index_checkouts_on_user_id"
  end

  create_table "circulation_statuses", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_circulation_statuses_on_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.integer "library_group_id"
    t.string "property"
    t.string "code"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_group_id"], name: "index_colors_on_library_group_id"
  end

  create_table "content_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_id"
    t.string "attachment_filename"
    t.integer "attachment_size"
    t.string "attachment_content_type"
    t.jsonb "attachment_data"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.string "alpha_2"
    t.string "alpha_3"
    t.string "numeric_3"
    t.text "note"
    t.integer "position"
    t.index ["alpha_2"], name: "index_countries_on_alpha_2"
    t.index ["alpha_3"], name: "index_countries_on_alpha_3"
    t.index ["name"], name: "index_countries_on_name"
    t.index ["numeric_3"], name: "index_countries_on_numeric_3"
  end

  create_table "create_types", force: :cascade do |t|
    t.string "name"
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creates", id: :serial, force: :cascade do |t|
    t.integer "agent_id", null: false
    t.uuid "work_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "create_type_id"
    t.index ["agent_id"], name: "index_creates_on_agent_id"
    t.index ["work_id"], name: "index_creates_on_work_id"
  end

  create_table "demands", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.bigint "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_demands_on_item_id"
    t.index ["message_id"], name: "index_demands_on_message_id"
    t.index ["user_id"], name: "index_demands_on_user_id"
  end

  create_table "doi_records", id: :serial, force: :cascade do |t|
    t.string "body", null: false
    t.string "registration_agency"
    t.uuid "manifestation_id"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_doi_records_on_body", unique: true
    t.index ["manifestation_id"], name: "index_doi_records_on_manifestation_id"
  end

  create_table "donates", force: :cascade do |t|
    t.integer "agent_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_donates_on_agent_id"
    t.index ["item_id"], name: "index_donates_on_item_id"
  end

  create_table "exemplifies", force: :cascade do |t|
    t.uuid "manifestation_id", null: false
    t.uuid "item_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_exemplifies_on_item_id", unique: true
    t.index ["manifestation_id"], name: "index_exemplifies_on_manifestation_id"
  end

  create_table "extents", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_of_works", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frequencies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifier_types", force: :cascade do |t|
    t.string "name"
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifiers", id: :serial, force: :cascade do |t|
    t.string "body", null: false
    t.integer "identifier_type_id", null: false
    t.uuid "manifestation_id"
    t.boolean "primary"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body", "identifier_type_id"], name: "index_identifiers_on_body_and_identifier_type_id"
    t.index ["manifestation_id"], name: "index_identifiers_on_manifestation_id"
  end

  create_table "identities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", null: false
    t.index ["email"], name: "index_identities_on_email"
    t.index ["name"], name: "index_identities_on_name"
    t.index ["profile_id"], name: "index_identities_on_profile_id"
  end

  create_table "import_request_transitions", force: :cascade do |t|
    t.string "to_state"
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "import_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["import_request_id"], name: "index_import_request_transitions_on_import_request_id"
    t.index ["sort_key", "import_request_id"], name: "index_import_request_transitions_on_sort_key_and_request_id", unique: true
  end

  create_table "import_requests", id: :serial, force: :cascade do |t|
    t.string "isbn"
    t.uuid "manifestation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "index_import_requests_on_isbn"
    t.index ["manifestation_id"], name: "index_import_requests_on_manifestation_id"
    t.index ["user_id"], name: "index_import_requests_on_user_id"
  end

  create_table "inventories", id: :serial, force: :cascade do |t|
    t.uuid "item_id"
    t.integer "inventory_file_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_file_id"], name: "index_inventories_on_inventory_file_id"
    t.index ["item_id"], name: "index_inventories_on_item_id"
  end

  create_table "inventory_files", id: :serial, force: :cascade do |t|
    t.string "filename"
    t.string "content_type"
    t.integer "size"
    t.integer "user_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inventory_fingerprint"
    t.jsonb "attachment_data"
    t.index ["user_id"], name: "index_inventory_files_on_user_id"
  end

  create_table "isbn_records", id: :serial, force: :cascade do |t|
    t.string "body", null: false
    t.string "isbn_type"
    t.string "source"
    t.uuid "manifestation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_isbn_records_on_body", unique: true
    t.index ["manifestation_id"], name: "index_isbn_records_on_manifestation_id"
  end

  create_table "issn_records", id: :serial, force: :cascade do |t|
    t.string "body", null: false
    t.string "issn_type"
    t.string "source"
    t.uuid "manifestation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_issn_records_on_body", unique: true
    t.index ["manifestation_id"], name: "index_issn_records_on_manifestation_id"
  end

  create_table "item_has_use_restrictions", id: :serial, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.integer "use_restriction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_has_use_restrictions_on_item_id"
    t.index ["use_restriction_id"], name: "index_item_has_use_restrictions_on_use_restriction_id"
  end

  create_table "item_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.uuid "item_id", null: false
    t.boolean "most_recent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_transitions_on_item_id"
    t.index ["sort_key", "item_id"], name: "index_item_transitions_on_sort_key_and_item_id", unique: true
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "call_number"
    t.string "item_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "shelf_id", default: 1
    t.boolean "include_supplements", default: false, null: false
    t.text "note"
    t.string "url"
    t.integer "price"
    t.integer "lock_version", default: 0, null: false
    t.integer "required_role_id", default: 1, null: false
    t.integer "required_score", default: 0, null: false
    t.datetime "acquired_at"
    t.integer "bookstore_id"
    t.integer "budget_type_id"
    t.integer "circulation_status_id", default: 5, null: false
    t.integer "checkout_type_id", default: 1, null: false
    t.string "binding_item_identifier"
    t.string "binding_call_number"
    t.datetime "binded_at"
    t.uuid "manifestation_id"
    t.index ["binding_item_identifier"], name: "index_items_on_binding_item_identifier"
    t.index ["bookstore_id"], name: "index_items_on_bookstore_id"
    t.index ["checkout_type_id"], name: "index_items_on_checkout_type_id"
    t.index ["circulation_status_id"], name: "index_items_on_circulation_status_id"
    t.index ["item_identifier"], name: "index_items_on_item_identifier"
    t.index ["manifestation_id"], name: "index_items_on_manifestation_id"
    t.index ["required_role_id"], name: "index_items_on_required_role_id"
    t.index ["shelf_id"], name: "index_items_on_shelf_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "native_name"
    t.text "display_name"
    t.string "iso_639_1"
    t.string "iso_639_2"
    t.string "iso_639_3"
    t.text "note"
    t.integer "position"
    t.index ["iso_639_1"], name: "index_languages_on_iso_639_1"
    t.index ["iso_639_2"], name: "index_languages_on_iso_639_2"
    t.index ["iso_639_3"], name: "index_languages_on_iso_639_3"
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "lending_policies", id: :serial, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.uuid "user_group_id", null: false
    t.integer "loan_period", default: 0, null: false
    t.datetime "fixed_due_date"
    t.integer "renewal", default: 0, null: false
    t.integer "fine", default: 0, null: false
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "user_group_id"], name: "index_lending_policies_on_item_id_and_user_group_id", unique: true
    t.index ["item_id"], name: "index_lending_policies_on_item_id"
    t.index ["user_group_id"], name: "index_lending_policies_on_user_group_id"
  end

  create_table "libraries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.jsonb "short_display_name_translations"
    t.string "zip_code"
    t.text "street"
    t.text "locality"
    t.text "region"
    t.string "telephone_number_1"
    t.string "telephone_number_2"
    t.string "fax_number"
    t.text "note"
    t.integer "call_number_rows", default: 1, null: false
    t.string "call_number_delimiter", default: "|", null: false
    t.integer "library_group_id", default: 1, null: false
    t.integer "users_count", default: 0, null: false
    t.integer "position"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.text "opening_hour"
    t.string "isil"
    t.float "latitude"
    t.float "longitude"
    t.index ["library_group_id"], name: "index_libraries_on_library_group_id"
    t.index ["name"], name: "index_libraries_on_name", unique: true
  end

  create_table "library_groups", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.string "short_name", null: false
    t.cidr "my_networks"
    t.jsonb "login_banner_translations"
    t.text "note"
    t.integer "country_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.cidr "admin_networks"
    t.string "url", default: "http://localhost:3000/"
    t.jsonb "settings"
    t.jsonb "footer_banner_translations"
    t.text "html_snippet"
    t.string "book_jacket_source"
    t.integer "max_number_of_results", default: 500
    t.boolean "family_name_first", default: true
    t.string "screenshot_generator"
    t.integer "pub_year_facet_range_interval", default: 10
    t.bigint "user_id"
    t.index ["name"], name: "index_library_groups_on_name", unique: true
    t.index ["short_name"], name: "index_library_groups_on_short_name", unique: true
    t.index ["user_id"], name: "index_library_groups_on_user_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "name", null: false
    t.string "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifestation_checkout_stat_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.integer "manifestation_checkout_stat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["manifestation_checkout_stat_id"], name: "index_manifestation_checkout_stat_transitions_on_stat_id"
    t.index ["sort_key", "manifestation_checkout_stat_id"], name: "index_manifestation_checkout_stat_transitions_on_transition", unique: true
  end

  create_table "manifestation_checkout_stats", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_manifestation_checkout_stats_on_user_id"
  end

  create_table "manifestation_relationship_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manifestation_relationships", id: :serial, force: :cascade do |t|
    t.uuid "parent_id"
    t.uuid "child_id"
    t.integer "manifestation_relationship_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["child_id"], name: "index_manifestation_relationships_on_child_id"
    t.index ["manifestation_relationship_type_id"], name: "index_manifestation_relationships_on_relationship_type_id"
    t.index ["parent_id"], name: "index_manifestation_relationships_on_parent_id"
  end

  create_table "manifestation_reserve_stat_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.integer "manifestation_reserve_stat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["manifestation_reserve_stat_id"], name: "index_manifestation_reserve_stat_transitions_on_stat_id"
    t.index ["sort_key", "manifestation_reserve_stat_id"], name: "index_manifestation_reserve_stat_transitions_on_transition", unique: true
  end

  create_table "manifestation_reserve_stats", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_manifestation_reserve_stats_on_user_id"
  end

  create_table "manifestations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "original_title", null: false
    t.text "title_alternative"
    t.text "title_transcription"
    t.string "classification_number"
    t.string "manifestation_identifier"
    t.datetime "date_of_publication"
    t.datetime "date_copyrighted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "access_address"
    t.integer "language_id", default: 1, null: false
    t.integer "carrier_type_id", null: false
    t.integer "start_page"
    t.integer "end_page"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.integer "price"
    t.text "fulltext"
    t.string "volume_number_string"
    t.string "issue_number_string"
    t.string "serial_number_string"
    t.integer "edition"
    t.text "note"
    t.boolean "repository_content", default: false, null: false
    t.integer "lock_version", default: 0, null: false
    t.integer "required_role_id", default: 1, null: false
    t.integer "required_score", default: 0, null: false
    t.integer "frequency_id", default: 1, null: false
    t.boolean "subscription_master", default: false, null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_size"
    t.datetime "attachment_updated_at"
    t.text "title_alternative_transcription"
    t.text "description"
    t.text "abstract"
    t.datetime "available_at"
    t.datetime "valid_until"
    t.datetime "date_submitted"
    t.datetime "date_accepted"
    t.datetime "date_captured"
    t.string "pub_date"
    t.string "edition_string"
    t.integer "volume_number"
    t.integer "issue_number"
    t.integer "serial_number"
    t.integer "content_type_id", default: 1
    t.integer "year_of_publication"
    t.text "attachment_meta"
    t.integer "month_of_publication"
    t.boolean "fulltext_content"
    t.string "doi"
    t.boolean "serial"
    t.text "statement_of_responsibility"
    t.text "publication_place"
    t.text "extent"
    t.text "dimensions"
    t.string "attachment_id"
    t.string "attachment_fingerprint"
    t.jsonb "attachment_data"
    t.index ["access_address"], name: "index_manifestations_on_access_address"
    t.index ["attachment_id"], name: "index_manifestations_on_attachment_id"
    t.index ["carrier_type_id"], name: "index_manifestations_on_carrier_type_id"
    t.index ["date_of_publication"], name: "index_manifestations_on_date_of_publication"
    t.index ["doi"], name: "index_manifestations_on_doi"
    t.index ["manifestation_identifier"], name: "index_manifestations_on_manifestation_identifier", unique: true
    t.index ["updated_at"], name: "index_manifestations_on_updated_at"
  end

  create_table "medium_of_performances", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_request_transitions", force: :cascade do |t|
    t.string "to_state"
    t.text "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "message_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["message_request_id"], name: "index_message_request_transitions_on_message_request_id"
    t.index ["sort_key", "message_request_id"], name: "index_message_request_transitions_on_sort_key_and_request_id", unique: true
  end

  create_table "message_requests", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "message_template_id"
    t.datetime "sent_at"
    t.datetime "deleted_at"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_templates", force: :cascade do |t|
    t.string "status", null: false
    t.text "title", null: false
    t.text "body", null: false
    t.integer "position"
    t.string "locale", default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_message_templates_on_status", unique: true
  end

  create_table "message_transitions", force: :cascade do |t|
    t.string "to_state"
    t.text "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["message_id"], name: "index_message_transitions_on_message_id"
    t.index ["sort_key", "message_id"], name: "index_message_transitions_on_sort_key_and_message_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "read_at"
    t.integer "receiver_id"
    t.integer "sender_id"
    t.string "subject", null: false
    t.text "body"
    t.integer "message_request_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.index ["message_request_id"], name: "index_messages_on_message_request_id"
    t.index ["parent_id"], name: "index_messages_on_parent_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "owns", id: :serial, force: :cascade do |t|
    t.integer "agent_id", null: false
    t.uuid "item_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_owns_on_agent_id"
    t.index ["item_id"], name: "index_owns_on_item_id"
  end

  create_table "periodicals", id: :serial, force: :cascade do |t|
    t.text "original_title"
    t.string "periodical_type"
    t.uuid "manifestation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manifestation_id"], name: "index_periodicals_on_manifestation_id"
  end

  create_table "picture_files", force: :cascade do |t|
    t.integer "picture_attachable_id"
    t.string "picture_attachable_type"
    t.string "content_type"
    t.text "title"
    t.string "thumbnail"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_size"
    t.datetime "picture_updated_at"
    t.text "picture_meta"
    t.string "picture_fingerprint"
    t.string "picture_id"
    t.integer "picture_width"
    t.integer "picture_height"
    t.jsonb "image_data"
    t.index ["picture_attachable_id", "picture_attachable_type"], name: "index_picture_files_on_picture_attachable_id_and_type"
    t.index ["picture_id"], name: "index_picture_files_on_picture_id"
  end

  create_table "produce_types", force: :cascade do |t|
    t.string "name"
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produces", id: :serial, force: :cascade do |t|
    t.integer "agent_id", null: false
    t.uuid "manifestation_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "produce_type_id"
    t.index ["agent_id"], name: "index_produces_on_agent_id"
    t.index ["manifestation_id"], name: "index_produces_on_manifestation_id"
  end

  create_table "profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_group_id"
    t.uuid "library_id"
    t.string "locale"
    t.string "user_number"
    t.text "full_name"
    t.text "note"
    t.text "keyword_list"
    t.integer "required_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "checkout_icalendar_token"
    t.boolean "save_checkout_history", default: false, null: false
    t.datetime "expired_at"
    t.text "full_name_transcription"
    t.datetime "date_of_birth"
    t.index ["checkout_icalendar_token"], name: "index_profiles_on_checkout_icalendar_token", unique: true
    t.index ["library_id"], name: "index_profiles_on_library_id"
    t.index ["user_group_id"], name: "index_profiles_on_user_group_id"
    t.index ["user_number"], name: "index_profiles_on_user_number", unique: true
  end

  create_table "realize_types", force: :cascade do |t|
    t.string "name"
    t.text "display_name"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realizes", id: :serial, force: :cascade do |t|
    t.integer "agent_id", null: false
    t.uuid "expression_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "realize_type_id"
    t.index ["agent_id"], name: "index_realizes_on_agent_id"
    t.index ["expression_id"], name: "index_realizes_on_expression_id"
  end

  create_table "request_status_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_request_status_types_on_name", unique: true
  end

  create_table "request_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_request_types_on_name", unique: true
  end

  create_table "reserve_stat_has_manifestations", force: :cascade do |t|
    t.integer "manifestation_reserve_stat_id", null: false
    t.integer "manifestation_id", null: false
    t.integer "reserves_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manifestation_id"], name: "index_reserve_stat_has_manifestations_on_manifestation_id"
    t.index ["manifestation_reserve_stat_id"], name: "index_reserve_stat_has_manifestations_on_m_reserve_stat_id"
  end

  create_table "reserve_stat_has_users", force: :cascade do |t|
    t.integer "user_reserve_stat_id", null: false
    t.integer "user_id", null: false
    t.integer "reserves_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reserve_stat_has_users_on_user_id"
    t.index ["user_reserve_stat_id"], name: "index_reserve_stat_has_users_on_user_reserve_stat_id"
  end

  create_table "reserve_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.integer "reserve_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["reserve_id"], name: "index_reserve_transitions_on_reserve_id"
    t.index ["sort_key", "reserve_id"], name: "index_reserve_transitions_on_sort_key_and_reserve_id", unique: true
  end

  create_table "reserves", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.uuid "manifestation_id", null: false
    t.uuid "item_id"
    t.integer "request_status_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "expiration_notice_to_patron", default: false
    t.boolean "expiration_notice_to_library", default: false
    t.integer "pickup_location_id"
    t.datetime "retained_at"
    t.datetime "postponed_at"
    t.integer "lock_version", default: 0, null: false
    t.index ["item_id"], name: "index_reserves_on_item_id"
    t.index ["manifestation_id"], name: "index_reserves_on_manifestation_id"
    t.index ["pickup_location_id"], name: "index_reserves_on_pickup_location_id"
    t.index ["request_status_type_id"], name: "index_reserves_on_request_status_type_id"
    t.index ["user_id"], name: "index_reserves_on_user_id"
  end

  create_table "resource_export_file_transitions", force: :cascade do |t|
    t.string "to_state"
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "resource_export_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["resource_export_file_id"], name: "index_resource_export_file_transitions_on_file_id"
    t.index ["sort_key", "resource_export_file_id"], name: "index_resource_export_file_transitions_on_sort_key_and_file_id", unique: true
  end

  create_table "resource_export_files", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_export_id"
    t.integer "resource_export_size"
    t.string "resource_export_filename"
    t.jsonb "attachment_data"
    t.index ["resource_export_id"], name: "index_resource_export_files_on_resource_export_id"
  end

  create_table "resource_import_file_transitions", force: :cascade do |t|
    t.string "to_state"
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "resource_import_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["resource_import_file_id"], name: "index_resource_import_file_transitions_on_file_id"
    t.index ["sort_key", "resource_import_file_id"], name: "index_resource_import_file_transitions_on_sort_key_and_file_id", unique: true
  end

  create_table "resource_import_files", force: :cascade do |t|
    t.integer "parent_id"
    t.string "content_type"
    t.integer "size"
    t.integer "user_id"
    t.text "note"
    t.datetime "executed_at"
    t.string "resource_import_file_name"
    t.string "resource_import_content_type"
    t.integer "resource_import_size"
    t.datetime "resource_import_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "edit_mode"
    t.string "resource_import_fingerprint"
    t.text "error_message"
    t.string "user_encoding"
    t.integer "default_shelf_id"
    t.string "resource_import_id"
    t.jsonb "attachment_data"
    t.index ["parent_id"], name: "index_resource_import_files_on_parent_id"
    t.index ["resource_import_id"], name: "index_resource_import_files_on_resource_import_id"
    t.index ["user_id"], name: "index_resource_import_files_on_user_id"
  end

  create_table "resource_import_results", force: :cascade do |t|
    t.integer "resource_import_file_id"
    t.integer "manifestation_id"
    t.integer "item_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "error_message"
    t.index ["item_id"], name: "index_resource_import_results_on_item_id"
    t.index ["manifestation_id"], name: "index_resource_import_results_on_manifestation_id"
    t.index ["resource_import_file_id"], name: "index_resource_import_results_on_resource_import_file_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0, null: false
    t.integer "position"
  end

  create_table "search_engines", force: :cascade do |t|
    t.string "name", null: false
    t.text "display_name"
    t.string "url", null: false
    t.text "base_url", null: false
    t.text "http_method", null: false
    t.text "query_param", null: false
    t.text "additional_param"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series_statement_merge_lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series_statement_merges", force: :cascade do |t|
    t.integer "series_statement_id", null: false
    t.integer "series_statement_merge_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_statement_id"], name: "index_series_statement_merges_on_series_statement_id"
    t.index ["series_statement_merge_list_id"], name: "index_series_statement_merges_on_list_id"
  end

  create_table "series_statements", force: :cascade do |t|
    t.text "original_title"
    t.text "numbering"
    t.text "title_subseries"
    t.text "numbering_subseries"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title_transcription"
    t.text "title_alternative"
    t.string "series_statement_identifier"
    t.integer "manifestation_id"
    t.text "note"
    t.text "title_subseries_transcription"
    t.text "creator_string"
    t.text "volume_number_string"
    t.text "volume_number_transcription_string"
    t.boolean "series_master"
    t.integer "root_manifestation_id"
    t.index ["manifestation_id"], name: "index_series_statements_on_manifestation_id"
    t.index ["root_manifestation_id"], name: "index_series_statements_on_root_manifestation_id"
    t.index ["series_statement_identifier"], name: "index_series_statements_on_series_statement_identifier"
  end

  create_table "shelves", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.uuid "library_id", null: false
    t.integer "items_count", default: 0, null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "closed", default: false, null: false
    t.index ["library_id"], name: "index_shelves_on_library_id"
  end

  create_table "subscribes", id: :serial, force: :cascade do |t|
    t.integer "subscription_id"
    t.uuid "work_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_subscribes_on_subscription_id"
    t.index ["work_id"], name: "index_subscribes_on_work_id"
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.text "note"
    t.integer "user_id"
    t.integer "order_list_id"
    t.datetime "deleted_at"
    t.integer "subscribes_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_list_id"], name: "index_subscriptions_on_order_list_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "use_restrictions", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_use_restrictions_on_name", unique: true
  end

  create_table "user_checkout_stat_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.integer "user_checkout_stat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["sort_key", "user_checkout_stat_id"], name: "index_user_checkout_stat_transitions_on_sort_key_and_stat_id", unique: true
    t.index ["user_checkout_stat_id"], name: "index_user_checkout_stat_transitions_on_user_checkout_stat_id"
  end

  create_table "user_checkout_stats", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_checkout_stats_on_user_id"
  end

  create_table "user_export_file_transitions", force: :cascade do |t|
    t.string "to_state"
    t.text "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "user_export_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["sort_key", "user_export_file_id"], name: "index_user_export_file_transitions_on_sort_key_and_file_id", unique: true
    t.index ["user_export_file_id"], name: "index_user_export_file_transitions_on_file_id"
  end

  create_table "user_export_files", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "attachment_data"
  end

  create_table "user_group_has_checkout_types", id: :serial, force: :cascade do |t|
    t.uuid "user_group_id", null: false
    t.integer "checkout_type_id", null: false
    t.integer "checkout_limit", default: 0, null: false
    t.integer "checkout_period", default: 0, null: false
    t.integer "checkout_renewal_limit", default: 0, null: false
    t.integer "reservation_limit", default: 0, null: false
    t.integer "reservation_expired_period", default: 7, null: false
    t.boolean "set_due_date_before_closing_day", default: false, null: false
    t.datetime "fixed_due_date"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_checkout_count"
    t.index ["checkout_type_id"], name: "index_user_group_has_checkout_types_on_checkout_type_id"
    t.index ["user_group_id"], name: "index_user_group_has_checkout_types_on_user_group_id"
  end

  create_table "user_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "display_name_translations"
    t.text "note"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "valid_period_for_new_user", default: 0, null: false
    t.datetime "expired_at"
    t.integer "number_of_day_to_notify_overdue", default: 1, null: false
    t.integer "number_of_day_to_notify_due_date", default: 7, null: false
    t.integer "number_of_time_to_notify_overdue", default: 3, null: false
  end

  create_table "user_has_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_has_roles_on_role_id"
    t.index ["user_id"], name: "index_user_has_roles_on_user_id"
  end

  create_table "user_import_file_transitions", force: :cascade do |t|
    t.string "to_state"
    t.text "metadata", default: "{}"
    t.integer "sort_key"
    t.integer "user_import_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["sort_key", "user_import_file_id"], name: "index_user_import_file_transitions_on_sort_key_and_file_id", unique: true
    t.index ["user_import_file_id"], name: "index_user_import_file_transitions_on_user_import_file_id"
  end

  create_table "user_import_files", force: :cascade do |t|
    t.integer "user_id"
    t.text "note"
    t.datetime "executed_at"
    t.string "user_import_file_name"
    t.string "user_import_content_type"
    t.string "user_import_file_size"
    t.datetime "user_import_updated_at"
    t.string "user_import_fingerprint"
    t.string "edit_mode"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_encoding"
    t.integer "default_library_id"
    t.integer "default_user_group_id"
    t.jsonb "attachment_data"
  end

  create_table "user_import_results", force: :cascade do |t|
    t.integer "user_import_file_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "error_message"
  end

  create_table "user_reserve_stat_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: "{}"
    t.integer "sort_key", null: false
    t.integer "user_reserve_stat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "most_recent"
    t.index ["sort_key", "user_reserve_stat_id"], name: "index_user_reserve_stat_transitions_on_sort_key_and_stat_id", unique: true
    t.index ["user_reserve_stat_id"], name: "index_user_reserve_stat_transitions_on_user_reserve_stat_id"
  end

  create_table "user_reserve_stats", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_reserve_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.datetime "deleted_at"
    t.datetime "expired_at"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "confirmed_at"
    t.uuid "profile_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "withdraws", id: :serial, force: :cascade do |t|
    t.integer "basket_id"
    t.uuid "item_id"
    t.integer "librarian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_withdraws_on_basket_id"
    t.index ["item_id"], name: "index_withdraws_on_item_id"
  end

  add_foreign_key "accepts", "baskets", on_delete: :nullify
  add_foreign_key "accepts", "items"
  add_foreign_key "baskets", "users"
  add_foreign_key "checked_items", "baskets", on_delete: :nullify
  add_foreign_key "checked_items", "items"
  add_foreign_key "checkouts", "checkins"
  add_foreign_key "checkouts", "items"
  add_foreign_key "checkouts", "users"
  add_foreign_key "creates", "agents"
  add_foreign_key "doi_records", "manifestations"
  add_foreign_key "exemplifies", "items"
  add_foreign_key "exemplifies", "manifestations"
  add_foreign_key "identifiers", "manifestations"
  add_foreign_key "import_requests", "manifestations"
  add_foreign_key "import_requests", "users"
  add_foreign_key "inventories", "inventory_files"
  add_foreign_key "inventories", "items"
  add_foreign_key "inventory_files", "users"
  add_foreign_key "isbn_records", "manifestations"
  add_foreign_key "issn_records", "manifestations"
  add_foreign_key "item_has_use_restrictions", "items"
  add_foreign_key "item_has_use_restrictions", "use_restrictions"
  add_foreign_key "items", "manifestations"
  add_foreign_key "lending_policies", "items"
  add_foreign_key "lending_policies", "user_groups"
  add_foreign_key "library_groups", "users"
  add_foreign_key "owns", "agents"
  add_foreign_key "owns", "items"
  add_foreign_key "periodicals", "manifestations"
  add_foreign_key "produces", "agents"
  add_foreign_key "produces", "manifestations"
  add_foreign_key "reserves", "items"
  add_foreign_key "reserves", "manifestations"
  add_foreign_key "reserves", "users"
  add_foreign_key "shelves", "libraries"
  add_foreign_key "subscribes", "subscriptions"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_group_has_checkout_types", "checkout_types"
  add_foreign_key "user_group_has_checkout_types", "user_groups"
  add_foreign_key "user_has_roles", "roles"
  add_foreign_key "user_has_roles", "users", on_delete: :cascade
  add_foreign_key "users", "profiles", on_delete: :cascade
  add_foreign_key "withdraws", "baskets", on_delete: :nullify
  add_foreign_key "withdraws", "items"
end
