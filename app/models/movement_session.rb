class MovementSession < ActiveRecord::Base
  belongs_to :user

  validates :timestamp, uniqueness: { scope: :user_id }
end
