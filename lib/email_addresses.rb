class EmailAddress < ActiveRecord::Base
  belongs_to :contact
  validates :email, :presence => true
  validates :email, :length => {:maximum => 50}
  validates_format_of :email, :with => /\w(\w*|\.*)@\w+.\w+/i, :on => :create
end







