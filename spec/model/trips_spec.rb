require 'rails_helper'

describe Trip do
  describe 'relationships' do
    it { should have_many(:trip_trails)}
    it {is_expected.to have_many(:trails).through(:trip_trails)}
  end
end
