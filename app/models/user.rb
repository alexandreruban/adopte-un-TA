class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_many :courses, dependent: :destroy
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.name.split(' ').first  # assuming the user model has a name
        user.last_name = auth.info.name.split(' ').second  # assuming the user model has a name
        # user.avatar = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end
    unless user.avatar.present?
      photo_url = auth.info.image
      user.remote_avatar_url = photo_url
      user.save
    end
    user
  end
end
