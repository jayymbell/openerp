Rails.application.routes.draw do

  resources :project_employees
  root 'dashboards#show'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy' 
  
  resources :users
  resources :projects
  resources :purchase_order_efforts
  resources :purchase_order_services
  resources :purchase_order_product_assemblies
  resources :purchase_orders
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
