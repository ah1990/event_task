class Api::V1::EventFiltersController < Api::V1::ApplicationController

  def index
    filters = EventFilter.where(user: current_user)
    render json: { filters: filters }
  end

  def create
    filter = EventFilter.new( name: params[:filter_name],
                              body: filter_params,
                              user: current_user )
    if filter.save
      render json: { filter: filter }
    else
      render json: { errors: filter.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def filter_params
    q = {}
    q.merge!({ city_id: params[:city_id].to_i }) if params[:city_id].present?
    q.merge!({ start_at: params[:start_at] }) if params[:start_at].present?
    q.merge!({ end_at: params[:end_at] }) if params[:end_at].present?
    q.merge!({ topic_id: params[:topic_id].to_i }) if params[:topic_id].present?
  end
end