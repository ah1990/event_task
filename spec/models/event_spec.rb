require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { create(:event) }
  let(:topic) { create(:topic) }

  before do
    event.topics << topic
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  describe 'relations' do
    it { should belong_to(:city) }
    it { should have_many(:topics) }
    it { should have_many(:event_topics) }
  end

  describe 'create topic' do
    it 'should success' do
      expect(event.topics.count).to eq(1)
    end

  end
end
