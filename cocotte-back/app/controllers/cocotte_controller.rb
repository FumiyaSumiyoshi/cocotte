class CocotteController < ApplicationController
  def menu
    #配列の生成
    dishArr = Array.new(10) { Array.new(10,0) }
    10.times do |i|
      dishArr[i][0] = Dish.find(i+1).id
      dishArr[i][1] = Dish.find(i+1).name
      dishArr[i][2] = Dish.find(i+1).picture_path
      dishArr[i][3] = Dish.find(i+1).recipe
      dishArr[i][4] = Genre.find(Dish.find(i+1).genre_id).genre
      dishArr[i][5] = Taste.find(Dish.find(i+1).taste_id).taste
      dishArr[i][6] = CookingTime.find(Dish.find(i+1).cooking_time_id).cooking_time
    end
    render json: dishArr
  end
end
