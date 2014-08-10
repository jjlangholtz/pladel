module DashboardsHelper
  def composite_percent(user)
    (user.nutrition_composite * 100).round
  end
end
