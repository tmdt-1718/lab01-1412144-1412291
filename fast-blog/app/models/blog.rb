class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { thumb: "300x300>"}, default_url: "https://cdn3.iconfinder.com/data/icons/tango-icon-library/48/image-x-generic-256.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
