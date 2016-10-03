class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(self.path).keep_if{|x| x.end_with?(".mp3")}
  end

  def import
    files.map{|song_file| Song.create_from_filename(song_file)}
    # self.files.map do |song_file|
    #   Song.create_from_filename(song_file)
    # end
  end
end
