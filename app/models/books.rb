class Books < ApplicationRecord
  belongs_to :user
  attachment :books
  has_many :profile_comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: {maximum: 200}
end
