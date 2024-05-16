class CreateTestsController < ApplicationController
  def index
    #create_testテーブルから全件取得
    @create_tests = CreateTest.all
    #puts @create_tests
  end
  def show
    #create_testテーブルから1件取得
    @create_test = CreateTest.find(params[:id])
    #puts @create_tests
  end
  def text
    @create_test = CreateTest.all
    #@dish = dish.all
    #配列の生成
    arr = Array.new(2) { Array.new(3,0) }
    arr[0][0] = CreateTest.find(1).id
    arr[0][1] = CreateTest.find(1).name
    arr[0][2] = CreateTest.find(1).age

    arr[1][0] = CreateTest.find(2).id
    arr[1][1] = CreateTest.find(2).name
    arr[1][2] = CreateTest.find(2).age
    #name = @create_test
    render json: { message: arr }
  end
end