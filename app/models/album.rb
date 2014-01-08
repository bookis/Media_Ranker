class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :artist, presence: true
  validates :description, presence: true
end
