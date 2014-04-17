class Response < ActiveRecord::Base
  belongs_to :answer_choice,
    class_name: AnswerChoice,
    foreign_key: :answer_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: User,
    foreign_key: :responder_id,
    primary_key: :id

  validates :responder_id, :answer_id, presence: true
  validate :respondent_has_not_already_answered_question

  private
  def respondent_has_not_already_answered_question
    vars = {responder_id: responder_id, answer_id: answer_id}
    question_for_user = Response.find_by_sql([<<-SQL, vars])
    SELECT
      *
    FROM
      answer_choices JOIN responses ON answer_choices.id = responses.answer_id
    WHERE
      responses.responder_id = :responder_id
    AND
      answer_choices.question_id = (
      SELECT
        answer_choices.question_id
      FROM
        answer_choices
      WHERE
        answer_choices.id = :answer_id
    )
    SQL

    if question_for_user.count == 0
      return
    else
      if self.id == question_for_user.first.id
        return
      else
        errors[:base] << 'Already answered that question'
      end
    end

  end
end