class Adventure < ActiveRecord::Base
    belongs_to :user
    has_many :adventure_photos, :dependent => :destroy

    accepts_nested_attributes_for :adventure_photos, :reject_if => lambda { |t| t['adventure_photos'].nil? }


    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
      validates_attachment :image,
        content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
        size: { in: 0..10.megabytes }

end
