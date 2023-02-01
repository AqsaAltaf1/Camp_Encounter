# frozen_string_literal: true

# User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :password, format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/,
    message: 'Password must contain one upercase,one lowercase and one special character' } # rubocop :disable Layout/HashAlignment

  def admin?
    type == 'Admin'
  end

  def super_admin?
    type == 'SuperAdmin'
  end

  def client?
    type == 'Client'
  end
end
