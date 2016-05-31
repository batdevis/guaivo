class Project < ApplicationRecord
  has_many :swagger_definitions
  has_many :links
end
