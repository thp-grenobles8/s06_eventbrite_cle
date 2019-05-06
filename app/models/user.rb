class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :events, dependent: :destroy
end
