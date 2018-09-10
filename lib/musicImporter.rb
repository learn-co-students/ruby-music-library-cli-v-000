class MusicImporter
  attr_reader :path

def initialize(path)
  @path = path

end
def files
 @files = []
 Dir.entries(@path).select {|file| file.include?('.mp3') ? @files << file : file = nil}
 @files
end
def import
  self.files.each {|file| Song.create_from_filename(file)}
end

end
