class QuestionsController < ApplicationController
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
end

def destroy
  @question.destroy
end

private

def question_params
  params.require(:question).permit(:body)
end
