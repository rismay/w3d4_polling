ned = User.create!(user_name: 'ned_likes_cats')
kush = User.create!(user_name: '2much_ku$h')

poll = Poll.create!(
  title: 'how many cats does it take to...',
  author_id: ned.id
)

q1 = Question.create!(
  poll_id: poll.id,
  text: '...to start a boot camp'
)

q2 = Question.create!(
  poll_id: poll.id,
  text: '... to build a rails app'
)

q3 = Question.create!(
  poll_id: poll.id,
  text: '... argue about the last two questions'
)

q4 = Question.create!(
  poll_id: poll.id,
  text: '... to make a poll'
)


a1q1 = AnswerChoice.create!(question_id: q1.id, text: 'only 1')
a2q1 = AnswerChoice.create!(question_id: q1.id, text: 'it takes 2')
a3q1 = AnswerChoice.create!(question_id: q1.id, text: 'kablammo!')

a1q2 = AnswerChoice.create!(question_id: q2.id, text: 'only 1')
a2q2 = AnswerChoice.create!(question_id: q2.id, text: 'it takes 2')
a3q2 = AnswerChoice.create!(question_id: q2.id, text: 'kablammo!')

a1q3 = AnswerChoice.create!(question_id: q3.id, text: 'only 1')
a2q3 = AnswerChoice.create!(question_id: q3.id, text: 'it takes 2')
a3q3 = AnswerChoice.create!(question_id: q3.id, text: 'kablammo!')

Response.create!(responder_id: kush.id, answer_id: a2q1.id)
Response.create!(responder_id: kush.id, answer_id: a1q2.id)
Response.create!(responder_id: kush.id, answer_id: a3q3.id)