class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = OctokitClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.response_status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end