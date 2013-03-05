Kennel::Application.routes.draw do

  scope '/mercury' do
    match ':type/:resource' => "mercury#resource"
    match 'snippets/:name/options' => "mercury#snippet_options"
    match 'snippets/:name/preview' => "mercury#snippet_preview"
  end

  root :to => "home#main"

  resources :pets do
    resources :photos
  end
  resources :posts
  resources :photos

  match 'gallery' => 'albums#index', :as => :gallery

  resources :albums do
    resources :photos
  end

  match 'admin' => 'admin/dashboard#home', :as => :admin
  match 'admin/settings' => 'admin/settings#show' , :as => :admin_settings
  match 'admin/settings/update' => 'admin/settings#update'

  namespace :admin do
    root :to => "dashboard#home"
    resources :photos
    resources :posts
    resources :albums do
      resources :photos
      collection do
        post 'uploader'
      end
    end
    resources :pets
    resources :people
    resources :static_pages
  end

  match '/pages/*path', :to => 'static_content#show', :via => :get, :as => 'static_page'

end
