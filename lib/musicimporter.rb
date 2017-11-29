class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(self.path).select{ |f| f.match(/(\.mp3)$/) }
  end

  def self.import
    if !self.files.nil?
      self.files.each {|filename| Song.new_from_filename(filename)}
    end
  end

end
