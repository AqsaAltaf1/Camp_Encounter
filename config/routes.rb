# frozen_string_literal: true

Rails.application.routes.draw do # rubocop :disable  Metrics/BlockLength
  root 'welcome#index'
  resources :camp_step
  resources :user_applications

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :camp_admin, path: :admin do
    resources :users do
      member do
        get :profile
      end
    end
  end

  namespace :camp_admin, path: :admin do
    resources :locations do
      member do
        get :active_camp
        get :intro
      end
    end
  end

  namespace :camp_admin, path: :admin do
    resources :camplocations
  end
end
