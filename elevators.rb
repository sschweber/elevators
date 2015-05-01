require './building.rb'
require './persons.rb'
require './floors.rb'

class Elevators

	def initialize (max_persons, resting_floor)
		@max_persons = max_persons
		@capacity = 0
		@resting_floor = resting_floor
		@current_floor = resting_floor
		@direction = "up"
	end

	def current
		return @current_floor
	end

	def increase_cap
		@capacity += 1
	end

	def decrease_cap
		@capacity -= 1
	end

	def move_to(n)
		if n == @current_floor
			@direction = "still"
			return @current_floor
		elsif n > @current_floor
			@direction = "up"
		else
			@direction = "down"
		end
		@current_floor = n
		@max_persons -= 1
		return @current_floor
	end

	def get_direction
		return @direction
	end

	def capacity
		return @capacity
	end

	def max
		return @max_persons
	end

	def to_s
		puts "Current floor: #{@current_floor}. Number of people able to fit: #{@max_persons}. Number of people currently on: #{@capacity}."
	end
end