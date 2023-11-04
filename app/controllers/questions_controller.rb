class QuestionsController < ApplicationController
  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end
end
