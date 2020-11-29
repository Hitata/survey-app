class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :publisher

  validates :title, presence: true

  scope :active, -> { where(active: true) }
end
