class Link < ApplicationRecord
  belongs_to :project
  validates :url, presence: true
  validates :project, presence: true

  mount_uploader :logo, LogoUploader

  def name
    super.blank? && self.id? ? url : super
  end

  def formatted_url
    (url.present? && url.start_with?("http")) ? url : "http://#{url}"
  end
end
