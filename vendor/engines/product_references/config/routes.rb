::Refinery::Application.routes.draw do
  resources :product_references, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :product_references, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
