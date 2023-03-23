require 'rails_helper'
RSpec.describe "telescope show page", type: :feature do
  it "telescopes ID and all attributes" do
    spitzer = Telescope.create!(name: "Spitzer Space Telescope",
                                functioning: false,
                                orbital_period: 372.2,
                                launch_date: '2003:08:25 00',
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
    visit "/telescopes/#{spitzer.id}"
    save_and_open_page
    expect(page).to have_content(spitzer.id)
    expect(page).to_not have_content(spitzer2.id)
    expect(page).to have_content(spitzer.name)
    expect(page).to have_content(spitzer.functioning)
    expect(page).to have_content(spitzer.orbital_period)
    expect(page).to have_content(spitzer.launch_date)
    expect(page).to have_content(spitzer.mission)
    expect(page).to have_content(spitzer.main_telescope_type)
    expect(page).to have_content(spitzer.created_at)
    expect(page).to have_content(spitzer.updated_at)
  end
end