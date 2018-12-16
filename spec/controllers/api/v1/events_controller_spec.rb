require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do
  include ApiHelper

  let!(:current_user) { create(:user) }
  let(:event) { create(:event) }
  let(:topic) { create(:topic) }

  before do
    event.topics << topic
  end

  it 'shows all events' do
    authenticated_header(request, current_user)
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'shows auth error' do
    get :index
    expect(response).to have_http_status(:unauthorized)
  end

  it 'shows events' do
    authenticated_header(request, current_user)
    get :index
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(1)
    expect(parsed_response.first['topics'].count).to eq(1)
    expect(parsed_response.first['topics'].first['name']).to eq('1st topic')
  end
end