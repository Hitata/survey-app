class Survey < ApplicationRecord
  has_many :survey_answers, dependent: :destroy
  belongs_to :survey

  validates :email, presence: true
end
