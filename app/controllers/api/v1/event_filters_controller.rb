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
    {
      city_id: params[:city_id],
      start_at: params[:start_at],
      end_at: params[:end_at],
      topic: params[:topic]
    }
  end
end