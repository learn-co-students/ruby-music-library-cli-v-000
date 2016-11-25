class MusicImporter
  attr_accessor :path, :files, :size

  def initialize(file_directory)
    self.path = file_directory
  end

  def files
    self.files = Dir["#{@path}/*"].collect{|song_file| song_file.split("/")[4]}
  end

  def import
    # self.files = Dir["#{self.path}/*"].collect{|song_file| song_file.split("/")[4]}
    self.files
    self.files.collect{|file_name| Song.create_from_filename(file_name)}
  end
end
