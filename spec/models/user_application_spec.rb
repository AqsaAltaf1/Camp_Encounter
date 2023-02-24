require 'rails_helper'

RSpec.describe UserApplication, type: :model do
  context 'user_application validation of model' do
    let (:user_application ) { build :user_application }
    it 'it should valid user-application with all attributes' do
      expect(user_application.valid?).to be_truthy
    end
  end

  context 'associations' do
    it { should belong_to(:user).optional }
    it { should belong_to(:location).optional  }
  end
end

