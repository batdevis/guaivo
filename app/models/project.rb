class Project < ApplicationRecord
  has_many :swagger_definitions
  has_many :links

  accepts_nested_attributes_for :swagger_definitions
  accepts_nested_attributes_for :links
end
