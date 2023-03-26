require 'rails_helper'
RSpec.describe "telescope index page", type: :feature do
  before :each do
  @spitzer = Telescope.create!(name: "Spitzer Space Telescope",
                              functioning: false,
                              orbital_period: 372.2,
                              launch_date: '2003:08:25',
                              mission: 'The planned mission period was to be 2.5 years wit...',
                              main_telescope_type: "Ritchey-Chretien",
                              created_at: '2023-03-24 02:30:46.959489'
                              )
  @spitzer2 = Telescope.create!(name: "Hubble Space Telescope",
                              functioning: false,
                              orbital_period: 32.2,
                              launch_date: '2003:08:25',
                              mission: 'The planned mion period was to be 2.5 years wit...',
                              main_telescope_type: "Ritchey-Chretien",
                              created_at: '2023-03-24 02:30:46.959489'
                              )   
  end
  it "can see all telescope names" do
    visit "/telescopes"
    expect(page).to have_content(@spitzer.name)
    expect(page).to have_content(@spitzer2.name)
    expect(page).to_not have_content(@spitzer.mission)
  end

  it "sorts objects by most recently created" do
    @hubble = Telescope.create!(name: "Hubble Telescope",
    functioning: false,
    orbital_period: 3.2,
    launch_date: '2003:08:25',
    mission: 'The planned mio be 2.5 years wit...',
    main_telescope_type: "Ritchey"
    )   
    visit "/telescopes"

    
    expect(@hubble.name).to appear_before(@spitzer.name)
    expect(@spitzer2.name).to_not appear_before(@hubble.name)
  end

  it 'displays when the telescope was created' do
    visit "/telescopes"

    expect(page).to have_content(@spitzer.created_at)
    expect(page).to have_content(@spitzer2.created_at)
  end

  it 'has a link that takes the user back to child index' do
    visit "/telescopes"
    
    expect(page).to have_link("Image Index")
    click_link "Image Index"
    expect(current_path).to eq('/images')
  end

  it 'has a link that takes the user back to parent index' do
    visit "/telescopes"
    
    expect(page).to have_link("Telescope Index")
    click_link "Telescope Index"
    expect(current_path).to eq('/telescopes')
  end
end