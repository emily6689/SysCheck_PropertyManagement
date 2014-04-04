require 'spec_helper'

feature "User can correlate owner with an existing building", %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # ---Acceptance Criteria---

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  before :each do
    building = FactoryGirl.build(:building)
    owner    = FactoryGirl.build(:owner)
    visit new_building_path
    fill_in 'Building Name',
      with: building.name
    fill_in 'Street Address',
      with: building.address
    fill_in 'City',
      with: building.city
    select('MA', :from=> "State")
    fill_in 'Postal Code',
      with: building.postalcode
    select owner.full_name, from: 'Owner'
    fill_in 'Description',
      with: building.description
    click_on 'Create Building'
  end

  scenario "I can optionally associate a building with its owner upon creating a building" do
    expect(page).to have_content("You've successfully submitted new building information!")

    visit building_path
    expect(page).to have_content(building.name)
    expect(page).to have_content(owner.full_name)
  end

  scenario "If I delete an owner, the associated buildinging no longer have an owner_id"


end
