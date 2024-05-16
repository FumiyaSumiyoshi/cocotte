# app/controllers/images_controller.rb

class ImagesController < ApplicationController
    def upload
      image = params[:image]
      # 画像をサーバーに保存する処理（例: public/uploads ディレクトリに保存）
      File.open(Rails.root.join('public', 'uploads', image.original_filename), 'wb') do |file|
        file.write(image.read)
      end
      # 画像のパスをデータベースに保存する処理
      Image.create(path: "/uploads/#{image.original_filename}")
      render json: { message: 'Image uploaded successfully' }
    end
  end
  