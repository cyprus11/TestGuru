class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def gist_hash
    self.gist_url.split('/')[-1]
  end

  def truncate_question(count)
    self.question.body.truncate(count)
  end
end
