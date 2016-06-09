class Project < ApplicationRecord
  has_many :swagger_definitions
  has_many :links

  accepts_nested_attributes_for :swagger_definitions, allow_destroy: true, reject_if: proc { |attributes| attributes['definition'].blank? }
  accepts_nested_attributes_for :links, allow_destroy: true, reject_if: proc { |attributes| attributes['url'].blank? }
end
