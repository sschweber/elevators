require './building.rb'
require './elevators.rb'
require './floors.rb'

class Persons

	def initialize (floor, desired_floor)
		@floor = floor
		@desired_floor = desired_floor
		@on_elevator = false
	end

	def end_location
		return @desired_floor
	end

	def request
		elevator = Elevators.new(5, 1)
		if @floor == @desired_floor
			return true
		end

		if @floor.elevator
			while @desired_floor != elevator.current do
				@on_elevator = true
				elevator.move_to(@desired_floor)
			end
			@on_elevator = false
		end
	end

	def to_s
		puts "Your current floor is #{@floor}, and your desired location is #{@desired_floor}."
	end
end