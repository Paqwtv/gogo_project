class Category < ApplicationRecord
  has_and_belongs_to_many :profile
  has_and_belongs_to_many :event
end
