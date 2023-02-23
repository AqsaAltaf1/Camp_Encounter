require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user validation of model' do
    let (:user) { build :user }
    it 'should be valid' do
      user.valid? == true
    end
  end
end
