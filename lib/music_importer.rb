require 'pry'

class MusicImporter

attr_accessor :path

def initialize(path)
  @path=path
end

def files
  #binding.pry
  #this link helps explain this: https://stackoverflow.com/questions/46575228/how-to-normalise-the-filename-to-just-the-mp3-filename-with-no-path-ruby
   Dir.chdir(@path) { | path | Dir.glob("*.mp3") }.sort
end

  def import
  files.each do |filename|
      song = Song.create_from_filename(filename)
    end
  end



end
