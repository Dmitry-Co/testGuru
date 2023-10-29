class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  scope :correct_answers, -> { joins(:answers).where(answers: { correct: true }) }
end
