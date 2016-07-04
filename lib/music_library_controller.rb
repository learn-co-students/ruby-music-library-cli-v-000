class MusicLibraryController

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    #returns all file names
    files = Dir.entries(path)
    files.delete_if { |item| !item.end_with?('.mp3') } 
  end

  def importer
    files.each{|file_name| Song.new_by_filename(file_name)}
  end

end