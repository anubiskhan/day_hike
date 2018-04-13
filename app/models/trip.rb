class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_length
    trails.sum(:length)
  end

  def average_length
    trails.average(:length)
  end

  def longest_hike
    trails.maximum(:length)
  end

  def shortest_hike
    trails.minimum(:length)
  end
end
