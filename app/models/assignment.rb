class Assignment < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :classroom_id
  validates_presence_of :status
  validates_inclusion_of :status, in: ['Live', 'Closed']
  validates_presence_of :video_link
  validates_format_of :video_link, with: /^((http|ftp|https?):\/\/((?:[-a-z0-9]+\.)+[a-z]{2,}))/, multiline: true

  belongs_to :classroom,
    inverse_of: :assignments

  has_many :submissions,
    inverse_of: :assignment,
    dependent: :destroy

  has_many :questions,
    inverse_of: :assignment,
    dependent: :destroy

  accepts_nested_attributes_for :questions

  def parse_video
    if video_link.include?('youtube')
      parsed_id = video_link.gsub("https://www.youtube.com/watch?v=",'')
      "//www.youtube.com/embed/" + parsed_id
    elsif video_link.include?('vimeo')
      parsed_id = video_link.gsub("https://vimeo.com/", '')
      "//player.vimeo.com/video/" + parsed_id
    else
      'Error'
    end
  end
end
