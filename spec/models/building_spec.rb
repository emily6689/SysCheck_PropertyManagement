require 'spec_helper'

describe Building do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:postalcode) }
  end

  context 'associations' do
    it { should belong_to(:owner) }
  end

end
