require 'spec_helper'

feature 'create a new building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do

  # ---Acceptance Criteria---

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  before :each do
    visit new_building_path
  end

  scenario 'I can create a building ' do
    prev_count = Building.all.count
    building = FactoryGirl.build(:building)
    fill_in 'Building Name',
      with: building.name
    fill_in 'Street Address',
      with: building.address
    fill_in 'City',
      with: building.city
    select('MA', :from=> "State")
    fill_in 'Postal Code',
      with: building.postalcode
    fill_in 'Description',
      with: building.description

    click_on 'Create Building'

    expect(current_path).to eql(new_building_path)
    expect(page).to have_content("You've successfully submitted new building information!")
    expect(Building.all.count).to eql(prev_count + 1)
  end


  scenario "I get an error if I don't specifiy all required information" do
    prev_count = Building.all.count
    click_on 'Create Building'

    expect(Building.all.count).to eql(prev_count)
    expect(page).to have_content("can't be blank")
  end
end











