require './building.rb'
require './persons.rb'
require './elevators.rb'

class Floors
#doesn't need to know num of elevators and people decide to get on elevator
#people need to ask floor is there an elevator here
	def initialize (n, elevators, people)
		@elevators = elevators
		@people = Array.new
		@number_of_elevators = 0
		@floor_num = n
		@number_of_people = people
	end

	#check if an elevator is available on this floor
	def elevator
		@elevators.each do |e|
			if e.current == @floor_num
				@number_of_elevators += 1
				e.increase_cap
				if e.capacity >= e.max
					@number_of_elevators -= 1
					puts "Elevator is full!"
					return false
				end
				puts "On Elevator"
				@number_of_elevators += 1
				e.to_s
				return true
			end
		end
		puts "No Elevators Available"
	end

	def people_waiting
		return @number_of_people
	end

	def create_people
		while @number_of_people > 0 do
			@people.push(Persons.new(@floor_num))
			@number_of_people -= 1
		end
	end

	def request_elevator
		@people.each do |person|
			if person.end_location != @floor_num
				if elevator
					person.request
				else
					@elevator.each do |e|
						if e.max > 0
							e.move_to(@floor_num)
							break
						end
					end
				end
			end
		end

		@number_of_people -= 1
	end

	def to_s
		puts "You are on floor #{@floor_num}, and there are #{@number_of_elevators} elevators that are available."
	end

end