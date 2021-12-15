module QuestionsHelper
  def question_header(test)
    return "Create New #{test.title} Question" if params[:action] == 'new'
    "Edit #{test.title} Question"
  end
end