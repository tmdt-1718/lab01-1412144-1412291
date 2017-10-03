class Photo < ApplicationRecord
  belongs_to :album
  validates :source, presence: true
  has_attached_file :source, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment_content_type :source, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
