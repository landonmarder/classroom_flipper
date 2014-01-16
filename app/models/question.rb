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
    binding.pry
  end
end
