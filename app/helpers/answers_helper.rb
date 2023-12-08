module AnswersHelper
  def answer_header(answer)
    answer.new_record? ? "Create new #{@answer.question.test.title} Answer" : "Edit #{answer.question.test.title} Answer"
  end
end
