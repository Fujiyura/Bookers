Rails.application.routes.draw do
  root 'top#index'
  resources :books

  get 'books/' => 'books#index', as: 'index_books'
  get 'books/:id/' => 'books#show', as: 'show_books'
  get 'books/:id/edit' => 'books#edit', as: 'edit_books'
  patch 'books/:id' => 'books#update', as: 'update_books'
  delete 'books/:id' => 'books#destroy', as: 'destroy_books'
end
