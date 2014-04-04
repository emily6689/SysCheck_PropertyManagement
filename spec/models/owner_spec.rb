require 'spec_helper'

describe Owner do
  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should have_valid(:email).when('emily@williams.com', "me@you.com") }
    it { should_not have_valid(:email).when('', nil, "me@.com", "@you.com") }
  end

end
