require 'pry'
class MusicImporter
  #   extend Concerns::Findable
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
   # @files = Dir['#{@path}/*'] #empty return
    Dir.entries(@path).find_all {|file| file.include?(".mp3")}
#binding.pry
  end


  def import
      self.files.each do |song|
#binding.pry
        song = Song.new_from_filename(filename)

     end
   end
end