class Super

	include Concerns::InstanceMethods
	extend Concerns::ClassMethods

	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
	end

	def self.all
		@@all
	end

end