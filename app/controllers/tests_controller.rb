class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_test, only: :start

  def index
    @tests = Test.displayed
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end