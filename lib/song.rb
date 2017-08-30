class Song < Super
  def self.create(name)
    instance = Song.new(name)
    instance.save
    instance
  end
end
