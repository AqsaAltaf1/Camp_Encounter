# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :camp_admin, path: 'admin' do
    resources :users do
      member do
        get 'profile'
      end
    end
  end

  namespace :camp_admin, path: 'admin' do
    resources :locations
  end

  namespace :camp_admin, path: 'admin' do
    resources :camplocations
  end
end
