require 'rails_helper'

describe 'visitor' do
  describe 'goes to trail show' do
    it 'takes visitor to trip show page' do
      trip = Trip.create(name: 'First trip', start_date: '01/01/2018', end_date: '01/05/2018')
      trail1 = Trail.create(length: 3, name: 'First trail', address: 'middle o nowhere')
      trail2 = Trail.create(length: 4, name: 'Second trail', address: 'middle o somewhere')
      TripTrail.create(trip_id: trip.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip.id, trail_id: trail2.id)
      
      visit trail_path(trail1)

      expect(page).to have_content(trail1.length)
      expect(page).to have_content(trail1.name)
      expect(page).to have_content(trail1.address)
      expect(page).to_not have_content(trail2.length)
      expect(page).to_not have_content(trail2.name)
      expect(page).to_not have_content(trail2.address)
    end
  end
end
