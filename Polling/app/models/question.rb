class Question < ActiveRecord::Base;
  has_many :answer_choices,
    class_name: AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id

  belongs_to :poll,
    class_name: Poll,
    foreign_key: :question_id,
    primary_key: :id

    has_many :responses, through: :answer_choices, source: :responses

  validates :text, :poll_id, presence: true

  def results
    query = <<-SQL
    SELECT a.*, COALESCE(b.r_count,0) AS response_count
    FROM answer_choices AS a
    LEFT OUTER JOIN (
      SELECT responses.answer_id AS ans_id, COUNT(*) AS r_count
      FROM responses
      GROUP BY ans_id
    ) AS b
    ON a.id = b.ans_id
    WHERE a.question_id = ?
    SQL

    answers_with_counts = AnswerChoice.find_by_sql([query, self.id])

    answers_with_counts.map do |ans|
      [ans.text, ans.response_count]
    end
  end
end