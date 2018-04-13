require 'rails_helper'

describe Trail do
  describe 'relationships' do
    it { should have_many(:trip_trails)}
    it {is_expected.to have_many(:trips).through(:trip_trails)}
  end
end
