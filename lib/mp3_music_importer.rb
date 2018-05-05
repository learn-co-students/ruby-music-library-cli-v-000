
class MusicImporter

  def initialize(file_path)
    @path = file_path
  end

  def path
    @path
  end

  def files
    @files = Dir.entries(self.path).select {|file| file.include? "mp3"}
    #binding.pry
  end

  def import
    self.files.each do |file_name|
      song_instance = Song.create_from_filename(file_name)
      song_instance
    end
  end

end
