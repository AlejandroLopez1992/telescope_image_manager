require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "relationship" do
    it { should belong_to :telescope }
  end
end