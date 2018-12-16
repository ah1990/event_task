# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_at, :end_at

  has_many :topics, each_serializer: TopicSerializer
  belongs_to :city, serializer: CitySerializer
end