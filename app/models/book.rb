class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true##opinionからbodyに変更
  validates :body, length: { maximum:200 }

end
