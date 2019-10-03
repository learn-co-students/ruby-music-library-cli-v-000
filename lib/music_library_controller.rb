class MusicLibraryController
  
  def initialize(path = "./db/mp3s", import = true)
    @path = path
    @import = import
    MusicImporter.new(path)
  end
  
  def call(input)
    input_1 = input.strip
  end
end