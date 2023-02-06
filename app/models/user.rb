# frozen_string_literal: true

# User
require 'csv'
# user
class User < ApplicationRecord
  paginates_per 3
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :password, format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/,
    message: 'Password must contain one upercase,one lowercase and one special character' } # rubocop :disable Layout/HashAlignment

  def self.to_csv
    attributes = %w[id first_name last_name email country phone_number type]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end

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
