require 'spec_helper'

describe PhoneNumber do 
  context 'validations' do 
    it {should ensure_length_of(:digits).is_equal_to(10)}
    it {should validate_presence_of :digits}
    it {should_not allow_value("blah").for(:digits)}
    it {should allow_value("9164562345").for(:digits)}
  end

  context 'associations' do
    it {should belong_to :contact}
  end

end
