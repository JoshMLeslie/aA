class Question < ApplicationRecord
  validates :query, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Poll"

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "AnswerChoice"

  has_many :responses,
    through: :answer_choices,
    source: :responses


  def results
    count_result = Hash.new(0)

    answer_choices = self
      .answer_choices.includes(:responses)

      answer_choices.each do |choice|
        count_result[choice.answer] += choice.responses.length
      end

      count_result

  end

end
