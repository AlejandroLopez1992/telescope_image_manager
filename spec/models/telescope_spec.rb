require 'rails_helper'

RSpec.describe Telescope, type: :model do
    describe 'relationship' do
      it { should have_many :images }
    end
end