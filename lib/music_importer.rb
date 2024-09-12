class MusicImporter
attr_reader :path, :files

def initialize (path)
  @path = path
end

def files
  @files = Dir.glob("#{@path}/*.mp3").collect {|song| song.gsub("#{@path}/","")}
end

def import
  self.files.each do |file_name|
    song = Song.create_from_filename(file_name)
  end
end

end
