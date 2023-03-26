require 'rails_helper'

RSpec.describe 'Telescope creation' do

  it 'links to the new page from the artists index' do
    visit '/telescopes'
    
    click_link("New Telescope")
    expect(current_path).to eq('/telescopes/new')
  end

  it 'can create a new telescope' do
    visit '/telescopes/new'

    fill_in('Name', with: "Spitzer Space Telescope" 'Mission', with: 'The planned mission period was to be' )
    fill_in('Functioning', with: false)
    fill_in('Orbital period', with: 372.2)
    fill_in('Launch date', with: '2003-08-25 20:59:04.850996')
    fill_in('Mission', with: 'The planned mission period was to be')
    fill_in('Main telescope type', with: "Ritchey-Chretien")
  
    click_button('Create Telescope')
    
    expect(current_path).to eq('/telescopes')
    expect(page).to have_content("Spitzer Space Telescope")
  end
end

