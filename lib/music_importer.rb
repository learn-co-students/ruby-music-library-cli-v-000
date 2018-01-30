class MusicImporter
  attr_accessor :files, :path
  @@cleaned = []

  def initialize(path)
    @path=path
    @files=Dir["#{path}/*"]  #pull all files
    @files=@files.collect{|file| file.sub("#{path}/","")}
    @@cleaned = @files.collect{|item| item.sub(".mp3","")}
  end

  def import
    @files.each{|file| Song.create_from_filename(file)}
  end

  def self.cleaned
    @@cleaned
  end
end
