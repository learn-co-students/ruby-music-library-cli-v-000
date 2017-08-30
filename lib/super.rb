class Super

	include Concerns::InstanceMethods
	extend Concerns::ClassMethods

	attr_accessor :name

	@@all = []



	def self.all
		@@all
	end



end
