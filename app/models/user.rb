class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true#追加
  #validates :name, exclusion: { in: 2..20 }##テストで失敗。
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :name, uniqueness: true#追加
  validates :introduction, length: { maximum: 50 }


end
