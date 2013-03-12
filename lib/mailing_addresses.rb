class MailingAddress < ActiveRecord::Base
  belongs_to :contact
  validates :building_number, :presence => true
  validates :street_name, :presence => true
  validates_format_of :street_name, :with => /\A(([a-zA-Z]+[a-z]*)|([1-9]*[0-9][a-z]{2}))( [a-zA-Z]+[a-z]*)?\z/,
    :message => "Name must be valid (e.g. Broadway, 19th Ave, Main Street)."
  validates :city, :presence => true
  validates_format_of :city, :with => /\A[a-z]+\s?[a-z]+\z/i,
    :message => "Name must be a valid (e.g. San Diego, Chicago, Seattle)"
  validates :state, :presence => true
  validates_format_of :state, :with => /\A[A-Z]{2,}\z/,
    :message => "Should be entered as a two-letter abbrevation (e.g. CA, NY, HI)"
  validates :zip_code, :presence => true
  validates_format_of :zip_code, :with => /\A[0-9]{5,}([-][0-9]{4})?\z/,
    :message => "Must be a valid US zip code."

  def display
    "#{self.building_number} #{self.street_name}\n#{self.city}, #{self.state} #{self.zip_code}"
  end
end