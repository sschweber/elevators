require './building.rb'
require './persons.rb'
require './elevators.rb'
require './floors.rb'

class Simulation
	attr_reader :time
	def initialize
		@time = 0
		@building = Building.new(2, 3, 7)
	end

	def run (n)
		@building.create_people
		@building.create_floors
		@building.create_elevators
		@building.to_s
		@time = n
		while @time > 0
			@building.send_elevator
			clock_tick
		end
	end

	def clock_tick
		@time = @time - 1
	end

	def create_building 
		return Building.new(2, 3, 7)
	end

end
s = Simulation.new
s.run(5)

#has to know about the things that do other things i.e. people are created here
#initialize with elevators floors and people... OR those are created in main method and passed to simulation
#register- how it knows about the elevators and people iterate through list of items