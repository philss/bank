Rails.application.routes.draw do
  mount Accounting::Engine => '/', as: 'accounting'
end
