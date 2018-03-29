require 'pry'

class MusicImporter

  attr_accessor :path, :arist, :song


  def initialize(path)
    @path = path
  end # initialize

  def path
    @path
  end # path

  ## Accepts a path and isolates all of the .mp3 files
  ## Isolates the filename by removing the path
  ## Returns an array of all filenames
  def files
    Dir.glob(self.path + '**/*.mp3').collect {|file| File.basename(file)}
  end # files

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end # import










end # class Music Importer
