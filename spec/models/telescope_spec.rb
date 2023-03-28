require 'rails_helper'

RSpec.describe Telescope, type: :model do
    describe 'relationship' do
      it { should have_many :images }
    end

    describe 'sort_alphabetically(order)' do
      it 'sorts images for telescope alphabetically' do
        @hubble = Telescope.create!(name: "Hubble Space Telescope",
                                    functioning: true,
                                    orbital_period: 95.42,
                                    launch_date: '1990-04-24 20:59:04.850776',
                                    mission: 'The Hubble Space Telescope (often referred to as HST or Hubble) is a space telescope that was launched into low Earth orbit in 1990 and remains in operation.',
                                    main_telescope_type: "Ritchey-Chretien"
                                    )
        @pia12108 = @hubble.images.create!(name: "beeer", 
                                          image_description: "Eerie, dramatic pictures from NASA Hubble telescope show newborn stars emerging from eggs -- dense, compact pockets of interstellar gas called evaporating gaseous globules or EGGs.", 
                                          earth_in_view: false, 
                                          exif_version: 0230)
        @nasty_17754652960_o = @hubble.images.create!(name: "aaab", 
                                                      image_description: "Astronomers using NASA’s Hubble Space Telescope have uncovered surprising new clues about a hefty, rapidly aging star whose behavior has never been seen before in our Milky Way galaxy. In fact, the star is so weird that astronomers have nicknamed it “Nasty 1,” a play on its catalog name of NaSt1. The star may represent a brief transitory stage in the evolution of extremely massive stars.", 
                                                      earth_in_view: false, 
                                                      exif_version: 2550)
    expect(@hubble.images.first).to eq(@pia12108)
    expect(@hubble.sort_alphabetically("clicked").first).to eq(@nasty_17754652960_o)
      end
    end
end