class SwaggerDefinition < ApplicationRecord
  mount_uploader :definition, SfUploader

  belongs_to :project

  validates :project, presence: true
#  validates :definition, presence: true

  def name
    super.blank? && self.id? ? "definition ##{id}" : super
  end
end
