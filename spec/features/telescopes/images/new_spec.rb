require 'rails_helper'

RSpec.describe 'new child creation', type: :feature do
  before :each do
    @spitzer = Telescope.create!(name: "Spitzer Space Telescope",
                                functioning: false,
                                orbital_period: 372.2,
                                launch_date: '2003-08-25 20:59:04.850996',
                                mission: 'The planned mission period was to be 2.5 years wit...',
                                main_telescope_type: "Ritchey-Chretien"
                                )
    @hubble = Telescope.create!(name: "Hubble Space Telescope",
                                functioning: true,
                                orbital_period: 95.42,
                                launch_date: '1990-04-24 20:59:04.850776',
                                mission: 'The Hubble Space Telescope (often referred to as HST or Hubble) is a space telescope that was launched into low Earth orbit in 1990 and remains in operation.',
                                main_telescope_type: "Ritchey-Chretien"
                                )
    @pia18033 = @spitzer.images.create!(name: "PIA18033", 
                                        image_description: "Behold one of the more stunningly detailed images ...", 
                                        earth_in_view: true, 
                                        exif_version: 1520)
    @pia09178 = @spitzer.images.create!(name: "PIA09178", 
                                        image_description: "This infrared image from NASA Spitzer Space Telescope shows the Helix nebula, a cosmic starlet often photographed by amateur astronomers for its vivid colors and eerie resemblance to a giant eye.", 
                                        earth_in_view: false, 
                                        exif_version: 0230)
    @pia12108 = @hubble.images.create!(name: "PIA12108", 
                                       image_description: "Eerie, dramatic pictures from NASA Hubble telescope show newborn stars emerging from eggs -- dense, compact pockets of interstellar gas called evaporating gaseous globules or EGGs.", 
                                       earth_in_view: false, 
                                       exif_version: 0230)
    @nasty_17754652960_o = @hubble.images.create!(name: "nasty_17754652960_o", 
                                                  image_description: "Astronomers using NASA’s Hubble Space Telescope have uncovered surprising new clues about a hefty, rapidly aging star whose behavior has never been seen before in our Milky Way galaxy. In fact, the star is so weird that astronomers have nicknamed it “Nasty 1,” a play on its catalog name of NaSt1. The star may represent a brief transitory stage in the evolution of extremely massive stars.", 
                                                  earth_in_view: false, 
                                                  exif_version: 2550)
    end
    it 'has a link to add a new child called create child' do
      visit "/telescopes/#{@hubble.id}/images"

      expect(page).to have_link("Create Image")
      click_link "Create Image"
      expect(current_path).to eq("/telescopes/#{@hubble.id}/images/new")
    end

    it 'can create a new image linked to that telescope' do
      visit "/telescopes/#{@hubble.id}/images/new"

      fill_in('Name', with: "example picture")
      fill_in('Image description', with: "Fancy description")
      fill_in('Earth in view', with: true)
      fill_in('Exif version', with: 2030)

      click_button("Create Image")

      expect(current_path).to eq("/telescopes/#{@hubble.id}/images")
      expect(page).to have_content("example picture")
    end
end