class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :adventures, dependent: :destroy

    acts_as_followable
    acts_as_follower

    accepts_nested_attributes_for :adventures,
                                  reject_if: proc { |attributes| attributes['title'].blank? },
                                  allow_destroy: true

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
            #  user.name = auth.info.name   # assuming the user model has a name
            #  user.image = auth.info.image # assuming the user model has an image
           end
         end


#
#    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
#    validates_attachment :image, :presence => true,
#      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
#      size: { in: 0..10.megabytes }

end
