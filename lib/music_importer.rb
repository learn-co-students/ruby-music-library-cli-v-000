require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    ## WHY DOESN'T DIR.CHILDREN(xxx) WORK HERE? I DID NOT MEAN TO CREATE THE EACH ITERATION BELOW.  HOW ELSE CAN THIS BE DONE EFFICIENTLY?
    Dir.entries(self.path).each do |filename|
      if filename != "." && filename != ".."
        @files << filename
      end
    end

    @files
  end

  def import
    import_array = self.files
    import_array.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
