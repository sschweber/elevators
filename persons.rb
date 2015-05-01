require './building.rb'
require './elevators.rb'
require './floors.rb'

class Persons

	def initialize (floors, desired_floor)
		@floors = floors
		@desired_floor = desired_floor
		@on_elevator = false
	end

	def end_location
		return @desired_floor
	end

	def request
		elevator = Elevators.new(5, 1)
		@floors.each do |f|
			if f.get_num == @desired_floor
				return true
			end

			if f.elevator
				while @desired_floor != elevator.current do
					@on_elevator = true
					puts "On Elevator"
					elevator.increase_cap
					elevator.move_to(@desired_floor)
				end
				elevator.decrease_cap
				puts "Off Elevator"
				@on_elevator = false
			end
		end
	end

	def to_s
		puts "Your current floor is #{@floor}, and your desired location is #{@desired_floor}."
	end
end