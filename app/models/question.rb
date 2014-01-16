class Question < ActiveRecord::Base
  validates_presence_of :assignment
  validates_presence_of :prompt

  belongs_to :assignment,
    inverse_of: :questions

  has_many :options,
    inverse_of: :question,
    dependent: :destroy

  accepts_nested_attributes_for :options

  has_many :answers,
    inverse_of: :question,
    dependent: :destroy

  def answers_per_option
    all_answers = Hash.new(0)
    answers.each do |answer|
      all_answers[answer.option.option_value] += 1
    end
    all_answers
  end
end
