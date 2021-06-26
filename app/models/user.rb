class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :introduction, length: { maximum: 200 }

 has_many :profile_image_id, dependent: :destroy
 attachment :profile_image_id

 has_many :books, dependent: :destroy
end
