require 'rails_helper'
RSpec.describe "image show page", type: :feature do

  before :each do
    @spitzer = Telescope.create!(name: "Spitzer Space Telescope",
                                functioning: false,
                                orbital_period: 372.2,
                                launch_date: '2003:08:25',
                                mission: 'The planned mission period was to be 2.5 years wit...',
                                main_telescope_type: "Ritchey-Chretien"
                                )
    @pia18033 = @spitzer.images.create!(name: "PIA18033", 
                                        image_description: "Behold one of the more stunningly detailed images ...", 
                                        earth_in_view: true, 
                                        exif_version: 1520)
    @pia18000 = @spitzer.images.create!(name: "PIA18000", 
                                        image_description: "Blurry Image of Star", 
                                        earth_in_view: false, 
                                        exif_version: 1577) 
    end
  it "can see all image names and attributes for specific image" do
    visit "/images/#{@pia18033.id}"

    save_and_open_page

    expect(page).to have_content(@pia18033.id)
    expect(page).to have_content(@pia18033.telescope_id)
    expect(page).to have_content(@pia18033.name)
    expect(page).to have_content(@pia18033.image_description)
    expect(page).to have_content(@pia18033.earth_in_view)
    expect(page).to have_content(@pia18033.exif_version)
    expect(page).to have_content(@pia18033.created_at)
    expect(page).to have_content(@pia18033.updated_at)

    expect(page).to_not have_content(@pia18000.name)
    expect(page).to_not have_content(@pia18000.image_description)
    expect(page).to_not have_content(@pia18000.earth_in_view)
  end
end