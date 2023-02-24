require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user validation of model' do
    let (:user) { build :user }

    it 'it should valid user with all attributes' do
      expect(user.valid?).to be_truthy
    end


    # it "password format should be valid" do
    #   user = User.new(email: "test@example.com", password: "Password123")
    #   assert user.valid?
    # end

    # it "password format should be invalid" do
    #   user = User.new(email: "test@example.com", password: "ppass")
    #   assert_not user.valid?
    #   assert_equal ["is too short (minimum is 7 characters)", "is invalid"], user.errors[:password]
    # end

    # it "user should create client" do
    #   client = Client.create(first_name: "ali")
    #   expect(client.persisted?).to be_truthy
    # end

    # it "user should create superAdmin" d
    #   admin = Admin.create(first_name: "ali")
    #   expect(admin.persisted?).to be_truthy
    # end

    # it "user should create Admin" do
    #   superAdmin = SuperAdmin.create(first_name: "ali")
    #   expect(superAdmin.persisted?).to be_truthy

    # end

    # it "user should not create user without name" do
    #   user = User.create(type: "client")
    #   expect(client.persisted?).to be_falsy
    # end

  end
end
