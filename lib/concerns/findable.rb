module Concerns::Findable
  def find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    self.all.each do |artist|
      if artist.name == name
        else
        artist = Artist.new(name)
      end
      return artist
    end
  end
end