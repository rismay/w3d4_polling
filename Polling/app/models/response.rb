class Response < ActiveRecord::Base
  belongs_to :answer_choice,
    class_name: AnswerChoice,
    foreign_key: :answer_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: User,
    foreign_key: :responder_id,
    primary_key: :id
end