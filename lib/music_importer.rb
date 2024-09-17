class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/","")} #takes a directory, pulls out each line that starts with path and ends in mp3, crops off the path, collects in array as "Artist - Song - genre.mp3"
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}    #separates above array into individual files that are passed to Song
  end

end
