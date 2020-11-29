class Question < ApplicationRecord
  belongs_to :survey

  validates :title, presence: true
end
