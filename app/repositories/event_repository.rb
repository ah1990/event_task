# frozen_string_literal: true

module EventRepository
  extend ActiveSupport::Concern

  included do
    scope :search_by_filters, ->(filter) do
      byebug
      return unless filter.present?
      e = joins(:city, :topics)
      e = e.where('(cities.id = :city_id)',
              { city_id: filter[:city_id] }) if filter[:city_id].present?
      e = e.where('events.start_at BETWEEN :start_at AND :end_at',
              { start_at: filter[:start_at],
                end_at: filter[:end_at] }) if filter[:start_at].present? && filter[:end_at].present?
      e.where('topics.id = :topic_id',
              { topic_id: filter[:topic_id]}) if filter[:topic_id].present?
    end
  end
end