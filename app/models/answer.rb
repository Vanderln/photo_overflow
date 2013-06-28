class Answer < ActiveRecord::Base
  include VotableHelper
  attr_accessible :content, :file, :path, :user_id, :question_id
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :question

  mount_uploader :file, PhotoUploader

  def self.submit_new_answer(params, question, current_user_id)
    answer = question.answers.build(
      params[:answer],
      question_id: question.id)
      answer.user_id = current_user_id
    answer.save ? answer : false
  end
end
