require 'rails_helper'

RSpec.describe UserApplication, type: :model do

  describe 'association' do
    it { should belong_to(:location) }
    it { should belong_to(:user) }
  end
end
