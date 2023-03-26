require 'rails_helper'

RSpec.describe 'Telescope edit' do

  it 'links to the telescope edit page' do
    @telescope = Telescope.create!(name: "Spitzer Space Telescope",
    functioning: false,
    orbital_period: 372.2,
    launch_date: '2003-08-25 20:59:04.850996',
    mission: 'The planned mission period was to be 2.5 years wit...',
    main_telescope_type: "Ritchey-Chretien"
   )
   visit "/telescopes/#{@telescope.id}"

   click_button "Update #{@telescope.name}"
   expect(current_path).to eq("/telescopes/#{@telescope.id}/edit")
  end

  it 'can edit the telescope' do
    @telescope = Telescope.create!(name: "Spitzer Space Telescope",
    functioning: false,
    orbital_period: 372.2,
    launch_date: '2003-08-25 20:59:04.850996',
    mission: 'The planned mission period was to be 2.5 years wit...',
    main_telescope_type: "Ritchey-Chretien"
   )

   visit "/telescopes/#{@telescope.id}"
   expect(page).to have_content("Spitzer Space Telescope")

   click_button "Update #{@telescope.name}"
   fill_in('Name', with: "Hummmus")
   fill_in('Functioning', with: false)
   fill_in('Orbital period', with: 372.2)
   fill_in('Launch date', with: '2003-08-25 20:59:04.850996')
   fill_in('Mission', with: 'The planned mission period was to be')
   fill_in('Main telescope type', with: "Ritchey-Chretien")
   click_button "Update Telescope"

   expect(current_path).to eq("/telescopes/#{@telescope.id}")
   expect(page).to have_content('Hummmus')
  end
end