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
         :recoverable, :rememberable, :trackable, :validatable

    has_attached_file :image, styles: { small: "64x64", med: "200x200", large: "400x400" }

    validates_attachment :image,
       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
       size: { in: 0..10.megabytes }

   def image_from_url(url)
       self.image = open(url)
   end

#
#    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
#    validates_attachment :image, :presence => true,
#      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
#      size: { in: 0..10.megabytes }

end
