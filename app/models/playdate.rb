class Playdate < ActiveRecord::Base
  belongs_to :creator, {class_name: "User", foreign_key: :creator_id}
  has_many   :matchups
  has_many   :dogs, through: :matchups

  validates :group_name, :location, :meet_time, presence: true
end
