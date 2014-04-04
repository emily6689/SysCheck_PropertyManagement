require 'spec_helper'

feature 'Record a building owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
  } do

  # ---Acceptance Criteria---
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  before :each do
    visit new_owner_path
  end


  scenario 'I enter all the required information' do
    prev_count = Owner.all.count
    owner      = FactoryGirl.build(:owner)

    fill_in 'First Name',
      with: owner.first_name
    fill_in 'Last Name',
      with: owner.last_name
    fill_in 'Email',
      with: owner.email
    click_on 'Create Owner'

    expect(page).to have_content("You've successfully recorded an owner!")
    expect(Owner.count).to eql(prev_count + 1)
    expect(current_path).to eql(new_owner_path)
  end

  scenario 'Required information is missing' do
    prev_count = Owner.all.count
    click_on 'Create Owner'

    expect(page).to have_content("Please fill in the required information.")
    expect(Owner.all.count).to eql(prev_count)
  end

end
