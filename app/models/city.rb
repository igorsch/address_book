class City < ActiveRecord::Base
  validates :name, presence: true
  validates :population,
    numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 8_175_113
    }
  validates :state, inclusion: {in: %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME,
                MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA,
                RI SC SD TN TX UT VT VA WA WV WI WY)}
  # validates :elevation,
  #   numericality: {
  #     greater_than_or_equal_to: 3315,
  #     if: lambda { |city| city.state == 'CO' },
  #     message: "is too low, lowest point in CO is 3838 feet."
  #   }

  validate :state_elevation
  
  def state_elevation
    if state && elevation
      low_elevation = states[state].first
      high_elevation = states[state].last
      
      if elevation.to_i < low_elevation
        errors.add(:elevation, "is too low, lowest point in #{state} is #{low_elevation}")
      elsif elevation.to_i > high_elevation
        errors.add(:elevation, "is too high, highest point in #{state} is #{high_elevation}")
      end
    end
  end
  
  def states
    @states ||= {
      'AL' => [0, 2407],
      'AK' => [0, 20320],
      'AZ' => [70, 12633],
      'AR' => [55, 2753],
      'CA' => [-282, 14494],
      'CO' => [3315, 14433],
      'CT' => [0, 2380],
      'DE' => [0, 448],
      'FL' => [0, 345],
      'GA' => [0, 4784],
      'HI' => [0, 13796],
      'ID' => [710, 12662],
      'IL' => [279, 1345],
      'IN' => [320, 1257],
      'IA' => [480, 1670],
      'KS' => [679, 4039],
      'KY' => [257, 4145],
      'LA' => [-8, 535],
      'ME' => [0, 5268],
      'MD' => [0, 3360],
      'MA' => [0, 3491],
      'MI' => [571, 1979],
      'MN' => [601, 2301],
      'MS' => [0, 806],
      'MO' => [230, 1772],
      'MT' => [1800, 12799],
      'NE' => [840, 5424],
      'NV' => [479, 13410],
      'NH' => [0, 6288],
      'NJ' => [0, 1803],
      'NM' => [2842, 13161],
      'NY' => [0, 5344],
      'NC' => [0, 6684],
      'ND' => [750, 3506],
      'OH' => [455, 1550],
      'OK' => [289, 4973],
      'OR' => [0, 11239],
      'PA' => [0, 3213],
      'RI' => [0, 812],
      'SC' => [0, 3560],
      'SD' => [966, 7242],
      'TN' => [178, 6643],
      'TX' => [0, 8749],
      'UT' => [2000, 13528],
      'VT' => [95, 4393],
      'VA' => [0, 5729],
      'WA' => [0, 14411],
      'WV' => [240, 4863],
      'WI' => [579, 1951],
      'WY' => [3099, 13804]
    }.with_indifferent_access
  end
end
