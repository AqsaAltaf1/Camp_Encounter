require 'rails_helper'

RSpec.describe Camplocation, type: :model do
  context 'camplocation validation of model' do
    let (:camplocation) { build :camplocation }

    it 'it should valid location with all attributes' do
      expect(camplocation.valid?).to be_truthy
    end
  end

end
