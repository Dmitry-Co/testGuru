class QuestionsController < ApplicationController
  def index
    @questions = @test.questions
  end
end
