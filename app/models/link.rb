class Link < ApplicationRecord
  belongs_to :project
  validates :url, presence: true
  validates :project, presence: true

  mount_uploader :logo, LogoUploader

  def name
    super.presence || url
  end

  def url
    super.start_with?("http") ? super : "http://#{super}"
  end
end
