class MusicImporter
  
attr_reader :path, :files, :import

def initialize(path)
  @path = path
end

def files
  Dir.entries(@path).select {|file| file.end_with?(".mp3")}
end

def import
  files.map {|file| Song.create_from_filename(file)}
end

end