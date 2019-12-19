class Post < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  validates :name,{presence: true,length:{maximum: 30}}
  validates :description,{presence: true,length:{maximum: 130}}
end
