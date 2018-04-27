class Response < ApplicationRecord
  validate :respondent_already_answered?
  # user_id => respondent

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    # call question then responses
    local_responses = self.question.responses
    local_responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if self.sibling_responses.exists? #=> called on objects
      errors[:base] << 'Response already exists!'
    end
  end
end



# r1.question.poll.user.id => 1
#
# r1 = Response.first
# r3 = Response.third
# r1.respondent_already_answered?
# r3.respondent_already_answered?
# r4 = Response.create(user_id: 1, answer_choice_id: 1)
