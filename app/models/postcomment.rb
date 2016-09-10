class Postcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: {maximum: 150}
  validates :score, presence: true, numericality: {greater_than: 0,max:5}

end
