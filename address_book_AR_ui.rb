require 'active_record'
require './lib/contact'
require './lib/email_addresses'
require './lib/phone_numbers'
require './lib/mailing_addresses'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

def welcome
  puts "Welcome to your Address Book!"
  menu
end

def menu
  puts "Main Menu Options"
  choice = nil
  until choice == 'x'
    puts "Press 'c' to add a contact, 'p' to add a phone number,\
         'm' to add a mailing address, 'i' to add an email address,\
         'v' to view your contacts, 'e' to edit your contacts,\
         'd' to delete a contact, or 'x' to exit the address book."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'c'
      add_contact
    when 'p'
      add_phone_number
    when 'm'
      add_mailing_address
    when 'i'
      add_email_address
    when 'v'
      view_contacts
    when 'e'
      edit_contacts
    when 'd'
      delete_contacts 
    when 'x'
      exit
    else
      invalid
    end
  end
end

def add_contact
  choice = nil
  puts "Options for New Contact"
  while choice != 'x'
    break if choice == 'x'
    puts "Enter the name of the new contact:"
    contact_name = gets.chomp
    contact = Contact.new(:name => contact_name)

    if contact.save
      puts "'#{contact.name}' has been added to your Address Book."
      add_phone(contact)
      add_email(contact)
      add_address(contact)
    else
      puts "That wasn't a valid name."
      contact.errors.full_messages.each {|message| puts message}
    end
  end
end

def add_phone(contact)
  choice = nil
  until choice == 'n'
    puts "Enter the type of phone number: (home, work, cell, etc):"
    phone_type = gets.chomp
    puts "Enter a phone number:"
    phone_number = gets.chomp
    phone = PhoneNumber.new(:digits => phone_number, :kind => phone_type, :contact_id => contact.id)
    if phone.save
      puts "'#{phone.digits}' has been added as a phone number for #{contact.name}."
    else
      puts "That wasn't a valid phone number."
      phone.errors.full_messages.each {|message| puts message}
    end
    
    puts "Do you have another phone number to add for this contact, y/n?"
    choice = gets.chomp
    if choice == 'n'
      puts "You can edit phone numbers for the contact later."
    elsif choice != 'y'
      puts "Invalid entry - Do you have another phone number to add for this contact, y/n?"
    else
      puts "Ready to add another number.."
    end
  end
end

def add_email(contact)
choice = nil
  until choice == 'n'
    puts "Enter the type of email address: (personal, work etc):"
    email_type = gets.chomp
    puts "Enter an email address:"
    email_address = gets.chomp
    email = EmailAddress.new(:email => email_address, :kind => email_type, :contact_id => contact.id)
    if email.save
      puts "'#{email.email}' has been added as a email address for #{contact.name}."
    else
      puts "That wasn't a valid email address."
      email.errors.full_messages.each {|message| puts message}
    end
    
    puts "Do you have another email address to add for this contact, y/n?"
    choice = gets.chomp
    if choice == 'n'
      puts "You can edit email addresess for the contact later."
    elsif choice != 'y'
      puts "Invalid entry - Do you have another email address to add for this contact, y/n?"
    else
      puts "Ready to add another address.."
    end
  end
end

def add_address(contact)
choice = nil
  until choice == 'n'
    puts "Enter the type for this address: (home, work, vacation, etc)"
    address_type = gets.chomp
    puts "Enter a building number for the mailing address:"
    building_number = gets.chomp
    puts "Enter the street name:"
    street_name = gets.chomp
    puts "Enter the city:"
    city = gets.chomp
    puts "Enter the state:"
    state = gets.chomp
    puts "Enter the zip code:"
    zip_code = gets.chomp
    address = MailingAddress.new(:building_number => building_number, :street_name => street_name,
                                  :city => city, :state => state, :zip_code => zip_code, :kind => address_type, :contact_id => contact.id)
    if address.save
      puts "'#{address.display}' has been added as a mailing address for #{contact.name}."
    else
      puts "That wasn't a valid mailing address."
      address.errors.full_messages.each {|message| puts message}
    end
    
    puts "Do you have another mailing address to add for this contact, y/n?"
    choice = gets.chomp
    if choice == 'n'
      puts "You can edit mailing addresess for the contact later."
    elsif choice != 'y'
      puts "Invalid entry - Do you have another mailing address to add for this contact, y/n?"
    else
      puts "Ready to add another address.."
    end
  end
end
    

    


def view_contact
  puts "Please enter the name of the contact you want to view:"
  contact_name = gets.chomp
  contact = Contact.new(:name => contact_name)
  puts "Here is the information for '#{contact_name}':"


  email = EmailAddress.new(:email => email_address, :kind => email_type, :contact_id => contact.id)
  address = MailingAddress.new(:building_number => building_number, :street_name => street_name,
                                  :city => city, :state => state, :zip_code => zip_code, :kind => address_type, :contact_id => contact.id)

  phone = PhoneNumber.new(:digits => phone_number, :kind => phone_type, :contact_id => contact.id)  

end

welcome

def exit
  puts "Leaving the address book..."
end

    # puts "Press 'x' to exit."
    
    # puts "What type of contact is this?"
    # puts "Press 'p' if the is a person."
    # puts "Press 'o' if the type is other (e.g. business, group, household)"
    # choice = gets.chomp
    # puts "Press 'c' to add a contact, 'p' to add a phone number,\
    #      'm' to add a mailing address, 'i' to add an email address,\
    #      'v' to view your contacts, 'e' to edit your contacts,\
    #      'd' to delete a contact, or 'x' to exit the address book."