class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      UserBadgesService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    result = client.call

    if client.success?
      flash_options = { notice: t('.success', link: result['html_url']) }
      create_gist(question: @test_passage.current_question, gist_url: result['html_url'])
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist(params)
    current_user.gists.create(params)
  end
end