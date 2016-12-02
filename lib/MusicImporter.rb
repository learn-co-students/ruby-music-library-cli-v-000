class MusicImporter

attr_accessor :path

@@files = []

  def initialize(path)
    @path=path
    #binding.pry
    Dir["#{path}/*"].each do |file|
      parsed_file = file.split("/")[-1]
      unless @@files.include?(parsed_file)
        @@files << parsed_file
      end
    end
  end

  def files
    @@files
  end

  def import
    @@files.each do |filename|
      Song.create_from_filename(filename)

    #  binding.pry
    end
   #binding.pry
  end

end
