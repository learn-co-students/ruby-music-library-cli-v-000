class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    require 'find'
    mp3_file_paths = []
    Find.find(@path) do |path|
      if path =~ /.*\.mp3$/
        path.slice! "./spec/fixtures/mp3s/"
        mp3_file_paths << path
      end
    end
    mp3_file_paths
  end

  def import
    files.each {|f| Song.new_from_filename(f)}
  end
end
