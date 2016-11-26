module RunHelper
  def convert_hours_to_seconds(params)
    (params.to_i)*3600
  end

  def convert_minutes_to_seconds(params)
    (params.to_i)*60
  end

  def find_midpoint(user_coord, result_coord)
    [(user_coord[0] + result_coord[0]) / 2 , (user_coord[1] + result_coord[1]) / 2 ]
  end

end
