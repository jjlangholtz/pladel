class MovementSession < ActiveRecord::Base
  belongs_to :user

  validates :timestamp, uniqueness: { scope: :user_id }
  validates :steps, numericality: { greater_than: 0 }
end
