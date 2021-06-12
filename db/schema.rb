# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_12_171434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_jobs", force: :cascade do |t|
    t.bigint "applicant_id", null: false
    t.bigint "job_id", null: false
    t.boolean "is_active"
    t.boolean "is_primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_applicant_jobs_on_applicant_id"
    t.index ["job_id"], name: "index_applicant_jobs_on_job_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_applicants_on_person_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "quantity"
    t.decimal "cost"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_organizations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "organization_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_organizations_on_customer_id"
    t.index ["organization_id"], name: "index_customer_organizations_on_organization_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_customers_on_person_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.bigint "parent_department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_department_id"], name: "index_departments_on_parent_department_id"
  end

  create_table "employee_departments", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "department_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employee_departments_on_department_id"
    t.index ["employee_id"], name: "index_employee_departments_on_employee_id"
  end

  create_table "employee_jobs", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "job_id", null: false
    t.boolean "is_active"
    t.boolean "is_primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_jobs_on_employee_id"
    t.index ["job_id"], name: "index_employee_jobs_on_job_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supervisor_id"
    t.index ["person_id"], name: "index_employees_on_person_id"
    t.index ["supervisor_id"], name: "index_employees_on_supervisor_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "short_description"
    t.string "long_description"
    t.decimal "total"
    t.boolean "is_invoiceable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "ends_on"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_order_id"
    t.date "starts_on"
    t.bigint "project_id"
    t.string "name"
    t.index ["project_id"], name: "index_invoices_on_project_id"
    t.index ["purchase_order_id"], name: "index_invoices_on_purchase_order_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_assemblies", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_assemblies_on_product_id"
  end

  create_table "product_assembly_components", force: :cascade do |t|
    t.bigint "product_assembly_id", null: false
    t.bigint "component_id", null: false
    t.decimal "quantity"
    t.decimal "cost"
    t.decimal "margin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["component_id"], name: "index_product_assembly_components_on_component_id"
    t.index ["product_assembly_id"], name: "index_product_assembly_components_on_product_assembly_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_customer_roles", force: :cascade do |t|
    t.bigint "project_customer_id", null: false
    t.bigint "role_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_customer_id"], name: "index_project_customer_roles_on_project_customer_id"
    t.index ["role_id"], name: "index_project_customer_roles_on_role_id"
  end

  create_table "project_customers", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "customer_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_project_customers_on_customer_id"
    t.index ["project_id"], name: "index_project_customers_on_project_id"
  end

  create_table "project_employee_roles", force: :cascade do |t|
    t.bigint "project_employee_id", null: false
    t.bigint "role_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_employee_id"], name: "index_project_employee_roles_on_project_employee_id"
    t.index ["role_id"], name: "index_project_employee_roles_on_role_id"
  end

  create_table "project_employees", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "employee_id", null: false
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_project_employees_on_employee_id"
    t.index ["project_id"], name: "index_project_employees_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_order_efforts", force: :cascade do |t|
    t.bigint "employee_id"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_order_id"
    t.bigint "job_id"
    t.decimal "hours"
    t.index ["employee_id"], name: "index_purchase_order_efforts_on_employee_id"
    t.index ["job_id"], name: "index_purchase_order_efforts_on_job_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_efforts_on_purchase_order_id"
  end

  create_table "purchase_order_product_assemblies", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "product_assembly_id", null: false
    t.decimal "quantity"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_assembly_id"], name: "index_purchase_order_product_assemblies_on_product_assembly_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_product_assemblies_on_purchase_order_id"
  end

  create_table "purchase_order_services", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "service_id", null: false
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.binary "tos_file"
    t.string "tos_file_type"
    t.index ["purchase_order_id"], name: "index_purchase_order_services_on_purchase_order_id"
    t.index ["service_id"], name: "index_purchase_order_services_on_service_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.string "name"
    t.index ["customer_id"], name: "index_purchase_orders_on_customer_id"
    t.index ["project_id"], name: "index_purchase_orders_on_project_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_employees", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "service_id", null: false
    t.boolean "is_active"
    t.boolean "is_primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_service_employees_on_employee_id"
    t.index ["service_id"], name: "index_service_employees_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "base_rate"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "activation_digest"
    t.datetime "activation_sent_at"
    t.datetime "activation_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "reset_at"
    t.string "password_digest"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_users_on_person_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_work_orders_on_project_id"
  end

  create_table "workflow_states", force: :cascade do |t|
    t.bigint "workflow_id", null: false
    t.string "name"
    t.text "description"
    t.boolean "is_start"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workflow_id"], name: "index_workflow_states_on_workflow_id"
  end

  create_table "workflow_transitions", force: :cascade do |t|
    t.bigint "workflow_id", null: false
    t.string "name"
    t.text "description"
    t.bigint "source_state_id", null: false
    t.bigint "target_state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_state_id"], name: "index_workflow_transitions_on_source_state_id"
    t.index ["target_state_id"], name: "index_workflow_transitions_on_target_state_id"
    t.index ["workflow_id"], name: "index_workflow_transitions_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "applicant_jobs", "applicants"
  add_foreign_key "applicant_jobs", "jobs"
  add_foreign_key "applicants", "people"
  add_foreign_key "customer_organizations", "customers"
  add_foreign_key "customer_organizations", "organizations"
  add_foreign_key "customers", "people"
  add_foreign_key "departments", "departments", column: "parent_department_id"
  add_foreign_key "employee_departments", "departments"
  add_foreign_key "employee_departments", "employees"
  add_foreign_key "employee_jobs", "employees"
  add_foreign_key "employee_jobs", "jobs"
  add_foreign_key "employees", "employees", column: "supervisor_id"
  add_foreign_key "employees", "people"
  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "product_assemblies", "products"
  add_foreign_key "product_assembly_components", "components"
  add_foreign_key "product_assembly_components", "product_assemblies"
  add_foreign_key "project_customer_roles", "project_customers"
  add_foreign_key "project_customer_roles", "roles"
  add_foreign_key "project_customers", "customers"
  add_foreign_key "project_customers", "projects"
  add_foreign_key "project_employee_roles", "project_employees"
  add_foreign_key "project_employee_roles", "roles"
  add_foreign_key "project_employees", "employees"
  add_foreign_key "project_employees", "projects"
  add_foreign_key "purchase_order_efforts", "employees"
  add_foreign_key "purchase_order_product_assemblies", "product_assemblies"
  add_foreign_key "purchase_order_product_assemblies", "purchase_orders"
  add_foreign_key "purchase_order_services", "purchase_orders"
  add_foreign_key "purchase_order_services", "services"
  add_foreign_key "purchase_orders", "customers"
  add_foreign_key "service_employees", "employees"
  add_foreign_key "service_employees", "services"
  add_foreign_key "users", "people"
  add_foreign_key "work_orders", "projects"
  add_foreign_key "workflow_states", "workflows"
  add_foreign_key "workflow_transitions", "workflow_states", column: "source_state_id"
  add_foreign_key "workflow_transitions", "workflow_states", column: "target_state_id"
  add_foreign_key "workflow_transitions", "workflows"
end
