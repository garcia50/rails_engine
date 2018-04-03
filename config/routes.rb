Rails.application.routes.draw do
  resources :customers, only: [:index]
  resources :merchants, only: [:index]
  resources :items, only: [:index]
  resources :invoices, only: [:index]
  resources :invoice_items, only: [:index]
  resources :transactions, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
