class	Muppet
	attr_reader :name, :awesomeness

	def initialize(name,awesomeness=10)
		@name, @awesomeness = name, awesomeness
	end

	# compare awesomeness
	def <=>(muppet)
		awesomeness <=> muppet.awesomeness
	end

	def to_s
		"#{name} (#{awesomeness})"
	end
end

muppets = [
	Muppet.new("Rowlf", 100),
	Muppet.new()
]


# This is a comment
class Person

	attr_accessor :name

	def initalize(attributes = {})
		@name = attributes[:name]
	end

	def self.greet
		"hello"
	end
end

person1 = Person.new(:name => "Chris")
print Person::greet, " ", person1.name, "\n"
