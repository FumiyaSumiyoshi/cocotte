Rails.application.routes.draw do
  get 'cocotte/menu'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Vue連携テスト用
  get '/api/test', to: 'application#test' # ここを追加

  #DB疎通テスト
  # 参考サイト https://qiita.com/to3izo/items/422e06724f360e1d0d19
  get '/create_tests', to: 'create_tests#index' # ここを追加

  #DB疎通テスト
  get '/create_tests/:id', to: 'create_tests#show', as: "create_test" # ここを追加

  #DB疎通テスト
  get '/app/text', to: 'create_tests#text' # ここを追加

  #cocotte用のテーブル表示テスト
  get '/cocotte_tests', to: 'cocotte_tests#index' # ここを追加

  # VueにDBの値を是件表示するテスト
  get '/', to: 'create_tests#index' # ここを追加

  # VueにDBの値を全件表示するテスト
  get '/', to: 'cocotte#menu' # ここを追加

  # 画像のアップロードエンドポイント
  post '/upload-image', to: 'images#upload'
end
