Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/upload_csv', to: 'employee_report#upload_csv'
  get '/payroll_report', to: 'employee_report#payroll_report'
  # Defines the root path route ("/")
  # root "articles#index"
end
