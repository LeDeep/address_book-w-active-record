class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :digits, :length => {:is => 10}
  validates :digits, :presence => true
  validates_format_of :digits, :with => /\A[0-9]{10,}\z/,
    :message => "Only numbers allowed."


  def display
    number = self.digits.split("")
    p "#{number[0..2].join("")}.#{number[3..5].join("")}.#{number[6..9].join("")}"
  end
end