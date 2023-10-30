class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :answers, length: { in: 1...5 }

  scope :correct_answers, -> { joins(:answers).where(answers: { correct: true }) }
end
