class MusicImporter
  attr_reader :path
  
def initialize(path)
  @path = path 
end 

def files
   @files = Dir.entries(@path)
   @files.delete_if {|file| file == "." || file == ".."}
end

def self.import
    self.files.each do |f| 
      song = Song.new(f)
      Artist.all << song.artist unless Artist.all.include?(song.artist)
    end 
  end
def import
  files.each { |file| Song.create_from_filename(file) }
end 
end 
  