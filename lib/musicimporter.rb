require 'pry'
class MusicImporter
  #@@files = []

  attr_accessor :path, :songs

  def initialize(file_path)
    @path = file_path
    @files = []
  end

  def files
    Dir["#{@path}/**/*.mp3"].each do |file_name|
      @files << file_name.gsub!(/.\/spec\/fixtures\/mp3s\//,"").to_s if @path == "./spec/fixtures/mp3s"
      @files << file_name.gsub!(/.\/spec\/fixtures\/other_mp3s\//,"").to_s if @path == "./spec/fixtures/other_mp3s"
    end
    #binding.pry

    @files
  end

  def import
    #@files = @files.uniq
    self.files
    #binding.pry
    @files.uniq
    @files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end
