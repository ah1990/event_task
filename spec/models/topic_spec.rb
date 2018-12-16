require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }
  let(:event) { create(:event) }

  before do
    topic.events << event
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'relations' do
    it { should have_many(:events) }
    it { should have_many(:event_topics) }
  end

  describe 'create topic' do
    it 'should success' do
      expect(topic.events.count).to eq(1)
    end

  end
end
