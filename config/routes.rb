Rails.application.routes.draw do
  match '*path', via: [:options], to: ->(_) { [204, { 'Content-Type' => 'text/plain' }, []] }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login'
      post 'sign_up', to: 'sessions#sign_up'
    end
  end
end
