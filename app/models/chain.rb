class Chain < ApplicationRecord
  has_many :rings
  belongs_to :user
end
