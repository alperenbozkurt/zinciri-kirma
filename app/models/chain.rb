class Chain < ApplicationRecord
  has_many :rings
  has_many :comments
  belongs_to :user
end
