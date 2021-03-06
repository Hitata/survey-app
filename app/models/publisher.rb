# frozen_string_literal: true

class Publisher < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :surveys, dependent: :destroy
  has_many :questions, through: :surveys

  validates :email, presence: true
end
