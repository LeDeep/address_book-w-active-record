require 'rspec'
require 'active_record'
require 'contact'
require 'shoulda-matchers'
require 'phone_numbers'
require 'email_addresses'
require 'mailing_addresses'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Contact.all.each {|contact| contact.destroy}
    PhoneNumber.all.each {|contact| contact.destroy}
    MailingAddress.all.each {|contact| contact.destroy}
    EmailAddress.all.each {|contact| contact.destroy}
  end
end