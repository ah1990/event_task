require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relations' do
    it { should have_many(:events) }
  end

end
