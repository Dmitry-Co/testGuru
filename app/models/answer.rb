class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:base, 'A question must have from 1 to 4 answers') if
     question.answers.count > 4 || question.answers.count < 1
  end
end
