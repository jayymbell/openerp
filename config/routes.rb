Rails.application.routes.draw do
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
