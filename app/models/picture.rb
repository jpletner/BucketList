class Picture < ActiveRecord::Base
    belongs_to :adventure

    has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "400x400" }

    validates_attachment :photo,
            content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
            size: { in: 0..10.megabytes }   
  
end


