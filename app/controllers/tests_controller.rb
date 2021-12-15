class TestsController < ApplicationController
  def show
    test = Test.find(params[:id])
    redirect_to test_questions_path(test)
  end
end