class MusicImporter

attr_accessor :path, :files

def initialize(path)
  @path=path
end

def files
  #this link helps explain this: https://stackoverflow.com/questions/46575228/how-to-normalise-the-filename-to-just-the-mp3-filename-with-no-path-ruby
   Dir.chdir(@path) {| path | Dir.glob("*.mp3")}
end

  def import
  files.each do |filename|
      song = Song.create_from_filename(filename)
    end
  end



end
