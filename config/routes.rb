Rails.application.routes.draw do  

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get :revenue, to: 'merchants#revenue'
        get :items, to: 'merchants#items'
        get :invoices, to:'merchants#invoices'
        
        collection do
          get :find, to: 'merchants#find'
        end
      end


      resources :invoices, only: [:index]

      
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index]
      resources :transactions, only: [:index]

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
