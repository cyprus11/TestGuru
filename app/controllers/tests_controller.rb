class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_test, only: :start
  before_action :check_questions, only: :start

  def index
    @tests = Test.with_questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def check_questions
    return redirect_to(root_path, notice: t('.no_questions')) unless @test.questions.present?
  end
end