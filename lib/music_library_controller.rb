class MusicLibraryController

# accept optional path, with a default
# instantiate a MusicImporter object > it will use this to import songs into the library
# Add a call method to ask for user input

  attr_reader :path

  def initialize (path = "./db/mp3s")
    @path = path
    object = MusicImporter.new(path)
    object.import
  end

  def call
    puts "Welcome!"
  end

end
