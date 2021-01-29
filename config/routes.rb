Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #indexのルーティング記述後、controller items indexでコントローラー作成
  resources :items
end
