class MusicImporter
  attr_accessor :path #:files

  def initialize(file_directory)
    @path = file_directory
  end

  def files
    files = Dir["#{@path}/*"].collect{|song_file| song_file.split("/")[4]}
  end

  def import
    files.collect{|file_name| Song.create_from_filename(file_name)}
  end
end
