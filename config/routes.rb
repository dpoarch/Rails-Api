Rails.application.routes.draw do
  resources :books do
    resources :borrows
  end
end
