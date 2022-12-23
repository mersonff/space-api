class Article < ApplicationRecord
  include LikeSearchable
  include Paginatable

  has_many :events, dependent: :destroy
  has_many :launches, dependent: :destroy
end
