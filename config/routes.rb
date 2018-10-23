Rails.application.routes.draw do
  devise_for :users, path: 'users'
  devise_for :venues, path: 'venues'
  root                  'static_pages#home'
  get                   '/about',                   to: 'static_pages#about'
  get                   '/contact',                 to: 'static_pages#contact'
end
