class MusicLibraryController
  attr_accessor :name

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call

  end

end
