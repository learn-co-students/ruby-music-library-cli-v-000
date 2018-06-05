class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    # @path = "./spec/fixtures/mp3s"
    file = File.open(@path, 'r')
  end

end
