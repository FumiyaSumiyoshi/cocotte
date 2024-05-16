class CocotteController < ApplicationController
  def menu
    #配列の生成
    arr = Array.new(3) { Array.new(3,0) }
    arr[0][0] = Dish.find(5001).id
    arr[0][1] = Dish.find(5001).name
    arr[0][2] = Dish.find(5001).picture_path

    render json: arr
  end
end
