class Question < ActiveRecord::Base;
  has_many :answer_choices,
  class_name: AnswerChoice,
  foreign_key: :question_id,
  primary_key: :id

  belongs_to :poll,
  class_name: Poll,
  foreign_key: :question_id,
  primary_key: :id

  validates :text, :poll_id, presence: true

end