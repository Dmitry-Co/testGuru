class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question_path(question)
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Sorry, question not found!'
  end
end