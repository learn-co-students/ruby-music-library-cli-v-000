class Genre
  extend Concerns::Findable
  # extend Concerns::Listable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  #
  # def save
  #   @@all << self
  # end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  # def self.destroy_all
  #   self.all.clear
  # end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  # def self.sorted_list
  #   super.each_with_index do |g,i|
  #     puts "#{i+1}. #{g.name}"
  #   end
  # end

end
