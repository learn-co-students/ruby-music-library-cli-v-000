class MusicLibraryController
attr_reader :path

def initialize(path = './db/mp3s')
  @path = path
  new_object = MusicImporter.new(path)
end

end
