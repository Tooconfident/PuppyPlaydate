class Dog < ActiveRecord::Base
  belongs_to :owner, {class_name: "User", foreign_key: :owner_id}
  has_many   :matchups
  has_many   :playdates, through: :matchups

  validates  :name, :breed, :age, :temperment, presence: true
end
