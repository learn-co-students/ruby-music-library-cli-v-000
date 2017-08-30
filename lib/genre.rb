class Genre < Super

  def self.create(name)
		instance = Genre.new(name)
		instance.save
		instance
	end


end
