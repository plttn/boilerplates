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
