Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  #indexのルーティング記述後、controller items indexでコントローラー作成
end
