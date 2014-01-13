class Option < ActiveRecord::Base
  validates_presence_of :question
  validates_presence_of :option_value

  belongs_to :question,
    inverse_of: :options

  has_many :answers,
    inverse_of: :option,
    dependent: :destroy
end
