class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
     filesarray= files
     filesarray.each{ |filename| Song.new_from_filename(filename)
     }
  end

    def files
    Dir.entries(@path).select do |filename|
      !(filename=="." || filename=="..")
      end
   end


end
