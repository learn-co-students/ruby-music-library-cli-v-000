class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir["#{path}/*"]
    @files.collect! { |file| file.match(/[^\/]*$/)[0] }
  end

end
