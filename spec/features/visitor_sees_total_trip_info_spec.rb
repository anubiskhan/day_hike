require 'rails_helper'

describe 'visitor' do
  describe 'is on show page' do
    it 'sees total trip length' do
      trip = Trip.create(name: 'First trip', start_date: '01/01/2018', end_date: '01/05/2018')
      trail1 = Trail.create(length: 3, name: 'First trail', address: 'middle o nowhere')
      trail2 = Trail.create(length: 4, name: 'Second trail', address: 'middle o somewhere')
      TripTrail.create(trip_id: trip.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip.id, trail_id: trail2.id)
      visit trips_path

      click_on 'First trip'

      expect(page).to have_content(7)
    end

    it 'sees average trip length' do
      trip = Trip.create(name: 'First trip', start_date: '01/01/2018', end_date: '01/05/2018')
      trail1 = Trail.create(length: 3, name: 'First trail', address: 'middle o nowhere')
      trail2 = Trail.create(length: 4, name: 'Second trail', address: 'middle o somewhere')
      TripTrail.create(trip_id: trip.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip.id, trail_id: trail2.id)
      visit trips_path

      click_on 'First trip'

      expect(page).to have_content(3.5)
    end

    it 'sees longest trip length' do
      trip = Trip.create(name: 'First trip', start_date: '01/01/2018', end_date: '01/05/2018')
      trail1 = Trail.create(length: 3, name: 'First trail', address: 'middle o nowhere')
      trail2 = Trail.create(length: 4, name: 'Second trail', address: 'middle o somewhere')
      TripTrail.create(trip_id: trip.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip.id, trail_id: trail2.id)
      visit trips_path

      click_on 'First trip'

      expect(page).to have_content("The longest hike is 4 miles")
    end

    it 'sees shorest trip length' do
      trip = Trip.create(name: 'First trip', start_date: '01/01/2018', end_date: '01/05/2018')
      trail1 = Trail.create(length: 3, name: 'First trail', address: 'middle o nowhere')
      trail2 = Trail.create(length: 4, name: 'Second trail', address: 'middle o somewhere')
      TripTrail.create(trip_id: trip.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip.id, trail_id: trail2.id)
      visit trips_path

      click_on 'First trip'

      expect(page).to have_content("The shorest hike is 3 miles")
    end
  end
end
