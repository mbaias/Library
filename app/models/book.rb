class Book < ActiveRecord::Base
	validates :name, presence:true, length:{minimum:1, maximum:40}
	validates :author, presence:true, length:{minimum:4, maximum:30}
	validates :year, presence:true, length:{minimum:4}
	belongs_to :category
	has_many :favorites
	has_many :users, through: :favorites
	has_attached_file :photo, styles: { thumb: ["100x200#", :jpg],
                            original: ['400x300>', :jpg],
                            medium: ['200x300#', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
