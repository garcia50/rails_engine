Rails.application.routes.draw do  

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get :revenue,           to: 'merchants#revenue'
        get :items,             to: 'merchants#items'
        get :invoices,          to: 'merchants#invoices'
        get :favorite_customer, to: 'merchants#favorite'
        get :customers_with_pending_invoices, to: 'merchants#pending'

        collection do
          get :most_revenue, to: 'merchants#most_revenue'
          get :most_items,   to: 'merchants#most_items'
          get :find,         to: 'merchants#find'
          get :find_all,     to: 'merchants#find_all'
        end
      end

      resources :invoices, only: [:index, :show] do 
        get :transactions, to: 'invoices#transactions'

        collection do 
          get :find, to: 'invoices#find'
          get :find, to: 'invoices#find_all'
        end
      end

      
      resources :customers, only: [:index, :show] do
        get :favorite_merchant, to: 'customers#favorite'
      end




      # resources :items, only: [:index, :show]
      # resources :invoice_items, only: [:index]
      # resources :transactions, only: [:index]

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
