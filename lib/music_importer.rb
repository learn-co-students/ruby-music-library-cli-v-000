class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
   Dir["#{path}/*mp3"].each {|file| file.sub!("./spec/fixtures/mp3s/", "")}
  end

end
