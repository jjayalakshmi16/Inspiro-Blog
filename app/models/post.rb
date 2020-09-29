class Post < ApplicationRecord
belongs_to :user
has_many :comments
acts_as_votable
has_attached_file :image, styles: { medium: "750x500#", thumb: "350x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
