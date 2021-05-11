class Books < ApplicationRecord
  belongs_to :user
  attachment :books
  has_many :profile_comments, dependent: :destroy
end
