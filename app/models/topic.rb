class Topic < ApplicationRecord

  has_many :event_topics, dependent: :destroy
  has_many :events, through: :event_topics

  validates :name, presence: true, uniqueness: true
end
