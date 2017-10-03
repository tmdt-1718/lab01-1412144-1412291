class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :albums, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, :password, :password_confirmation, presence: true
  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

         def self.new_with_session(params, session)
             super.tap do |user|
               if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                 user.email = data["email"] if user.email.blank?
               end

             end
           end

         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
             user.name = auth.info.name   # assuming the user model has a name
             user.avatar_fb = auth.info.avatar_fb # assuming the user model has an image
           end
         end

end
