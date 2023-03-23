require 'rails_helper'
RSpec.describe "telescope index page", type: :feature do
  it "can see all telescope names" do
    spitzer = Telescope.create!(name: "Spitzer Space Telescope",
                                functioning: false,
                                orbital_period: 372.2,
                                launch_date: '2003:08:25',
                                mission: 'The planned mission period was to be 2.5 years wit...',
                                main_telescope_type: "Ritchey-Chretien"
                                )
    spitzer2 = Telescope.create!(name: "Hubble Space Telescope",
                                functioning: false,
                                orbital_period: 32.2,
                                launch_date: '2003:08:25',
                                mission: 'The planned mion period was to be 2.5 years wit...',
                                main_telescope_type: "Ritchey-Chretien"
                                )    
    visit "/telescopes"
    expect(page).to have_content(spitzer.name)
    expect(page).to have_content(spitzer2.name)
    expect(page).to_not have_content(spitzer.mission)
  end
end