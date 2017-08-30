class Genre < Super

  def initialize(name)
    @name = name
  end

  def self.create(name)
		instance = Genre.new(name)
		instance.save
		instance
	end


end
