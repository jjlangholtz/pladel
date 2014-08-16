module DashboardsHelper
  def composite_percent(user)
    (user.nutrition_composite * 100).round
  end

  def nutrition_composite_empty?(user)
    composite_percent(user) == 0
  end

  def movement_composite_empty?(user)
    (user.movement_composite / 100).round == 0
  end

  def sleep_composite_empty?(user)
    (user.sleep_composite / 0.30).round == 0
  end

  def health_gpa_percent_denominator(user)
    denominator = 0
    composites = [nutrition_composite_empty?(user),
                  movement_composite_empty?(user),
                  sleep_composite_empty?(user)]
    composites.each do |composite|
      denominator += 1 if composite == false
    end
    denominator == 0 ? 1 : denominator
  end
end
