require 'spec_helper'

describe MailingAddress do 
  context 'associations' do 
    it {should belong_to :contact}
  end
  context 'validations' do
    it {should validate_presence_of :building_number}

    it {should validate_presence_of :street_name}
    it {should_not allow_value("17stockton").for(:street_name)}
    it {should allow_value("18th").for(:street_name)}
    it {should allow_value("Broadway").for(:street_name)}

    it {should validate_presence_of :city}
    it {should_not allow_value("Sacramento23").for(:city)}
    it {should allow_value("San Francisco").for(:city)}

    it {should validate_presence_of :state}
    it {should_not allow_value("2L").for(:city)}
    it {should allow_value("CA").for(:city)}

    it {should validate_presence_of :zip_code}
    it {should_not allow_value("uh no idea").for(:zip_code)}
    it {should allow_value("95814-0381").for(:zip_code)}
  end

  context 'display' do 
    it 'properly formats the address' do 
      mailing_address = MailingAddress.new(:building_number => '233', :street_name => 'Stockton', :city => 'Sacramento', :state => 'CA', :zip_code => '95855')
      mailing_address.save
      mailing_address.display.should eq "233 Stockton\nSacramento, CA 95855"
    end
  end

end



