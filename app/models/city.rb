class City < ActiveRecord::Base
  validates :name, presence: true
  validates :population,
    numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 8_175_113
  }
  validates :state, inclusion: { in:  %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME,
                MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA,
                RI SC SD TN TX UT VT VA WA WV WI WY) }
  validates :elevation,
    numericality: {
    greater_than_or_equal_to: 3315,
    if: lambda { |city| city.state == 'CO' },
    message: 'is too low, lowest point in CO is 3315 feet.'
    }
  
  @states = Hash.new

  @states['AL'] = [0, 2407]
  @states['AK'] = [0, 20320]
  @states['AZ'] = [70, 12633]
  @states['AR'] = [55, 2753]
  @states['CA'] = [-282, 14494]
  @states['CO'] = [3315, 14433]
  @states['CT'] = [0, 2380]
  @states['DE'] = [0, 448]
  @states['FL'] = [0, 345]
  @states['GA'] = [0, 4784]
  @states['HI'] = [0, 13796]
  @states['ID'] = [710, 12662]
  @states['IL'] = [279, 1345]
  @states['IN'] = [320, 1257]
  @states['IA'] = [480, 1670]
  @states['KS'] = [679, 4039]
  @states['KY'] = [257, 4145]
  @states['LA'] = [-8, 535]
  @states['ME'] = [0, 5268]
  @states['MD'] = [0, 3360]
  @states['MA'] = [0, 3491]
  @states['MI'] = [571, 1979]
  @states['MN'] = [601, 2301]
  @states['MS'] = [0, 806]
  @states['MO'] = [230, 1772]
  @states['MT'] = [1800, 12799]
  @states['NE'] = [840, 5424]
  @states['NV'] = [479, 13410]
  @states['NH'] = [0, 6288]
  @states['NJ'] = [0, 1803]
  @states['NM'] = [2842, 13161]
  @states['NY'] = [0, 5344]
  @states['NC'] = [0, 6684]
  @states['ND'] = [750, 3506]
  @states['OH'] = [455, 1550]
  @states['OK'] = [289, 4973]
  @states['OR'] = [0, 11239]
  @states['PA'] = [0, 3213]
  @states['RI'] = [0, 812]
  @states['SC'] = [0, 3560]
  @states['SD'] = [966, 7242]
  @states['TN'] = [178, 6643]
  @states['TX'] = [0, 8749]
  @states['UT'] = [2000, 13528]
  @states['VT'] = [95, 4393]
  @states['VA'] = [0, 5729]
  @states['WA'] = [0, 14411]
  @states['WV'] = [240, 4863]
  @states['WI'] = [579, 1951]
  @states['WY'] = [3099, 13804]
end
