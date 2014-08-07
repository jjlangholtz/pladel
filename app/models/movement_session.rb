class MovementSession < ActiveRecord::Base
  belongs_to :user

  def score
    (distance.to_f / 5280 * calories_burned).round
  end
end
