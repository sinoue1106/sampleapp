# -*- coding: utf-8 -*-
Rails.application.routes.draw do
  get 'welcome/index'
  get 'misc/error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :courses

  root 'welcome#index'

  #get 'courses/:id/destroy' to: ' courses#destroy'
end
