class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  def files
    Dir.foreach(@path) do |file|
      if file != "." && file !=".."
        @@files << file
      end
    end
    @@files
  end
  binding.pry
end
