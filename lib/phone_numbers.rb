class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :digits, :length => {:is => 10}
  validates :digits, :presence => true
  validates_format_of :digits, :with => /\A[0-9]{10,}\z/,
    :message => "Only numbers allowed."
end
