class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true
  validates :description, presence: true
end
