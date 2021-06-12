Rails.application.routes.draw do

  resources :workflow_transitions
  resources :workflow_states
  resources :workflows
  resources :customer_organizations
  resources :organizations
  resources :project_customer_roles
  resources :project_employee_roles
  resources :roles
  resources :project_customers
  resources :project_employees
  root 'dashboards#show'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy' 
  
  resources :users
  resources :projects
  resources :purchase_order_efforts
  resources :purchase_order_services
  get 'purchase_order_services/:id/download_tos', to: 'purchase_order_services#download_tos', as: :purchase_order_services_download_tos
  resources :purchase_order_product_assemblies
  resources :purchase_orders
  get 'purchase_orders/:id/duplicate', to: 'purchase_orders#duplicate', as: :purchase_orders_duplicate
  get 'invoices/:id/duplicate', to: 'invoices#duplicate', as: :invoices_duplicate
  resources :invoice_lines
  resources :invoices
  resources :service_employees
  resources :services
  resources :product_assembly_components
  resources :components
  resources :product_assemblies
  resources :products
  resources :applicant_jobs
  resources :customers
  resources :applicants
  resources :events
  resources :employee_departments
  resources :departments
  resources :employee_jobs
  resources :jobs
  resources :employees
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
