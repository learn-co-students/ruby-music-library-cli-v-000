require 'pry'
require_relative '../lib/concerns/findable.rb'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Array.new
    path = Dir.entries(@path)

    path.each do |i|
      if i.include?('.mp3')
        files << i
      end
    end
    files
  end

  def import
    self.files.each {|i| Song.create_from_filename(i)}
    binding.pry
  end
end
