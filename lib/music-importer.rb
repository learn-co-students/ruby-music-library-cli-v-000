require 'pry'

class MusicImporter


  def initialize(mp3_path)
    @path = mp3_path
  end

  def path
    @path
  end

  def files
    answer = []
    file_array = Dir.entries(self.path)
    file_array.collect {|file_name| answer << file_name if file_name.match(/\w/)}
    answer
  end

  def import
    files.each {|song_file| Song.create_from_filename(song_file)}
  end

end
