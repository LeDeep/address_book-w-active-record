require 'spec_helper'

describe EmailAddress do 
  context 'associations' do 
    it {should belong_to :contact}
  end

  context 'validations' do
    it {should_not allow_value("stuff").for(:email)}
    it {should allow_value("abc23@abc.com").for(:email)}
    it {should ensure_length_of(:email).is_at_most(50)}
    it {should validate_presence_of :email}
  end


end