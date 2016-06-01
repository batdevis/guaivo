class SwaggerDefinition < ApplicationRecord
  mount_uploader :definition, SfUploader

  belongs_to :project

  validates :project, presence: true
  validates :definition, presence: true

  def name
    super.presence || "definition ##{id || "0"}"
  end
end
