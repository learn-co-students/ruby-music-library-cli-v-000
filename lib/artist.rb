class Artist < Super
  def self.create(name)
		instance = Artist.new(name)
		instance.save
		instance
	end
end
