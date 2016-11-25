class MusicImporter
  attr_accessor :path, :files, :size

  def initialize(file_directory)
    @path = file_directory
  end

  def files
    @files = Dir["#{@path}/*"].collect{|song_file| song_file.split("/")[4]}
  end

  # def new_from_filename
  #   binding.pry
  #
  #   #files.each{|file_name| Song.new_by_filename(file_name)}
  # end
end
