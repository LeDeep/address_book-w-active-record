require 'spec_helper'

describe Contact do
  context 'validations' do
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(50)}
  end

  context 'associations' do
    it {should have_many(:phone_numbers)}
    it {should have_many(:email_addresses)}
    it {should have_many(:mailing_addresses)}
  end
end