class MusicImporter 

attr_accessor :path

@@files = []

def initialize(filepath)
  @path = filepath
end

def files
  Dir.foreach("./spec/fixtures/mp3s")  do |item| 
  if item != "." && item != ".." && item != "./spec/fixtures/mp3s"
  @@files << item 
  end
end
  @@files
end

def import
  Dir.foreach(@path) do |item| 
    if item != "." && item != ".." && item != "./spec/fixtures/mp3s"
      Song.create_from_filename(item)
    end
  end
end 


end