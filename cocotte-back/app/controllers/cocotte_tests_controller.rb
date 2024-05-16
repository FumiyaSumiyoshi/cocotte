class CocotteTestsController < ApplicationController
  def index
    @dish = CreateTest.all
  end
end
