class MusicImporter

attr_accessor :path


def initialize(path)
  @path = path
end

def files
  Dir.entries(path).select do |files|
    files.include?("mp3")
  end
end

def import
  files.collect do |songs|
    Song.create_from_filename(songs)
  end 
end

end
