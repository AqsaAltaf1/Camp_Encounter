require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'location validation of model' do
    let (:location) { build :location }

    it 'it should valid location with all attributes' do
      expect(location.valid?).to be_truthy
    end
  end

  context 'associations' do
      it { should have_many(:user_applications) }
  end
end
