require './persons.rb'
require './elevators.rb'
require './floors.rb'

class Building

	#attr_reader :ground_floor, :max_floor, :num_elevators, :people, :floors
	def initialize(number_of_elevators, number_of_floors, number_of_people)
		@ground_floor = 0
		@max_floor = number_of_floors
		@num_elevators = number_of_elevators
		@elevators = Array.new
		@number_of_people = number_of_people
		@people = Array.new
		@floors = Array.new
	end

	def create_people
		rand = Random.new
		i = @number_of_people
		while i > 0 do
			@people.push(Persons.new(@floors, rand.rand(2)+1))
			i -= 1
		end
		puts @people.to_s
	end

	#create given number of elevators
	def create_elevators
		i = @num_elevators
		while i > 0 do
			@elevators.push(Elevators.new(5, 1))
			i = i - 1
		end
	end

	#create given number of floors
	def create_floors 
		i = @max_floor
		while i > 0 do
			@floors.push(Floors.new(i, @elevators, @people))
			i -= 1
		end
	end
	#check if an elevator needs to be sent somewhere
	def send_elevator
		@floors.each do |f| #for each floor in floors
			if ((f.elevator != true) && (f.people_waiting > 0)) #if there is not an elevator on that floor, and there are people waiting
				f.request_elevator #send an elevator
				f.to_s
			end
		end
	end

	def to_s
		puts "There are #{@num_elevators} elevators available in this building which has 
			#{@max_floor} floors, and #{@number_of_people} people."
	end
end
