class MusicImporter
attr_accessor :path

def initialize(path)
  @path = path
end

def files
  Dir.entries(@path).sort.select{|file| file.end_with?(".mp3")}
end

def import
  files.each do |filename|
    Song.new_from_filename(filename)
  end
end

end
