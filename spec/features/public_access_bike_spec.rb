require 'DockingStation'

feature "public accesses bike from docking station" do
	scenario "releases a working bike from the docking station" do 
		docking_station = DockingStation.new
		docking_station.dock Bike.new
		bike = docking_station.release_bike
		expect(bike).to be_working
	end

	scenario "raises an error if there are no bikes in the docking station" do
		docking_station = DockingStation.new
		expect{docking_station.release_bike}.to raise_error "No Bikes Available"
	end

	scenario 'docking station does not release a broken bike' do
		docking_station = DockingStation.new
		bike = Bike.new
		bike.report_broken
		docking_station.dock bike 
		expect{docking_station.release_bike}.to raise_error 'Bike not working'
	end
end 
