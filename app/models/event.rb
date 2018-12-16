class Event < ApplicationRecord
  include EventRepository

  belongs_to :city
  has_many :event_topics, dependent: :destroy
  has_many :topics, through: :event_topics

  validates :start_at, :end_at, presence: true
end
