module RunHelper
  def convert_hours_to_seconds(params)
    (params.to_i)*3600
  end

  def convert_minutes_to_seconds(params)
    (params.to_i)*60
  end
end
