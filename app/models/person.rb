class Person < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email,
    :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z?},
    :message => 'should be xxxx@xxxxxx.xxx'
  validates :address_line_one, presence: true
  validates :city, presence: true
  validates :state, inclusion: { in:  %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME,
                MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA,
                RI SC SD TN TX UT VT VA WA WV WI WY)}
  validates_format_of :zip_code,
    :with => %r{\d{5}(-\d{4})?},
    :message => 'should be 12345 or 12345-1234'
end
