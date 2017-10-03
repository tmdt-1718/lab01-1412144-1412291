class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :name, :cover, presence: true
  has_attached_file :cover, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
