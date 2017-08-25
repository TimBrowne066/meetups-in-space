class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  has_many :rsvps
  has_many :users, through: :rsvps
  belongs_to :user
end
