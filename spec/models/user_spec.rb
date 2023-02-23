require 'rails_helper'

RSpec.describe User, type: :model do
  context '#validatons' do
    subject {
      User.new( first_name: 'alian',
                last_name: 'aliii',
                phone_number: '2242354235',
                email: "alian19@gmail.com",
                password: 'Alian19@',
                id: 22,
                country: 'pakistan'
                )
    }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a firstname" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a lastname" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a phonenumber" do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
