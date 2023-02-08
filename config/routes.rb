# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :camp_admin, path: 'admin' do
    resources :users
    resources :locations
    resources :camplocations
  end
end
