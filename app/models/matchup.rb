class Matchup < ActiveRecord::Base
  belongs_to :dog
  belongs_to :playdate
end
