class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render inline: "<h1>#{@question.body}</h1>"
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render inline: "<h1>Question created.</h1>"
    else
      render inline: "<h1>Oops, the question wasn't created...</h1>"
    end
  end

  def destroy
    if @question.destroy
      render inline: "<h1>Question deleted.</h1>"
    else
      render inline: "<h1>Question wasn't deleted.</h1>"
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render inline: '<h1>Question was not found.</h1>'
  end
end
