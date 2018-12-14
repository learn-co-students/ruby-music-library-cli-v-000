class MusicImporter
  attr_accessor :path

def initialize(file_path)
  @path = file_path
end

def files
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
end

def import
  self.files.each do |filename|
  Song.create_from_filename(filename)
  end
  end



end
