Accounting::Engine.routes.draw do
  get 'accounts/index'

  root to: 'accounts#index'
end
