class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :director, presence: true
  validates :description, presence: true
end
