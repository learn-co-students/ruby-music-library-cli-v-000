class MusicImporter
  attr_accessor :path, :list_of_filenames

  def initialize(path)
    @path = path


  end

  def files
    @@list_of_filenames = Dir.entries(path).select{|filename| filename =~/(\.mp3)/}

  end

  def import

    Dir.entries(path).select{|filename| filename =~/(\.mp3)/}.each do |filename|
      Song.create_from_filename(filename)
    end

  end

  def self.list
    @@list_of_filenames
  end


end
