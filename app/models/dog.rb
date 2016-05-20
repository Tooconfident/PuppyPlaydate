class Dog < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many   :playdates, through: :matchups

  validates  :name, :breed, :age, :temperment, presence: true
end
