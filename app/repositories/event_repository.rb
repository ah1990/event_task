# frozen_string_literal: true

module EventRepository
  extend ActiveSupport::Concern

  included do
    scope :search_by_filters, ->(filter) do
      e = joins(:city, :topics)
      e = e.where('(cities.id = :city_id)',
                  { city_id: filter[:city_id].to_i }) if filter[:city_id].present? && filter[:city_id].to_i != 0
      e = e.where('events.start_at BETWEEN :start_at AND :end_at',
              { start_at: filter[:start_at],
                end_at: filter[:end_at] }) if filter[:start_at].present? && filter[:end_at].present?
      e = e.where('topics.id = :topic_id',
              { topic_id: filter[:topic_id].to_i }) if filter[:topic_id].present? && filter[:topic_id].to_i != 0
      e.distinct
    end
  end
end