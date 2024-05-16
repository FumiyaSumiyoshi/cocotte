class Dish < ApplicationRecord
  belongs_to :genre
  belongs_to :taste
  belongs_to :cooking_time
end
