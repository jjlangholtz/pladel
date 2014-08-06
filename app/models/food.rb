class Food < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.vegetables
    self.where(group: 'vegetable')
  end

  def self.fish
    self.where(group: 'fish')
  end

  def self.meat
    self.where(group: 'meat')
  end

  def self.nuts
    self.where(group: 'nuts')
  end

  def self.fats
    self.where(group: 'fats')
  end

  def self.fruits
    self.where(group: 'fruits')
  end

  def self.spices
    self.where(group: 'spices')
  end
end
