class Link < ApplicationRecord
  belongs_to :project
  validates :url, presence: true
  validates :project, presence: true

  mount_uploader :logo, LogoUploader

  def name
    super.blank? && self.id? ? url : super
  end

  def url
    (super.present? && super.start_with?("http")) ? super : "http://#{super}"
  end
end
