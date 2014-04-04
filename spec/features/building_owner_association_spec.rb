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
    owner    = FactoryGirl.create(:owner)
    visit new_building_path
    fill_in 'Building Name',
      with: building.name
    fill_in 'Street Address',
      with: building.address
    fill_in 'City',
      with: building.city
    select 'MA', from: 'State'
    fill_in 'Postal Code',
      with: building.postalcode
    select owner.full_name, from: 'Owner'
    fill_in 'Description',
      with: building.description
    click_on 'Create Building'
  end

  scenario "I can optionally associate a building with its owner upon creating a building" do
    expect(page).to have_content("You've successfully submitted new building information!")
    #since the user must be redirected to the new building page, I'm confused as to how to test that the association has in fact been made.
  end

  scenario "If I delete an owner, the associated buildinging no longer have an owner_id" do
    owner = FactoryGirl.create(:owner, first_name: 'James', email: 'james@williams.com')
    owner_count = Owner.all.count
    building_count = Building.all.count
    visit owners_path
    expect(page).to have_content('James')

    click_on 'Destroy James'
    expect(Owner.all.count).to eql(owner_count - 1)
    expect(Building.count).to eql(building_count)
    expect(page).to_not have_content('James')
    expect(page).to have_content('Emily')
  end

end











