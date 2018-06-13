
module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|artist| artist.name == name}
  end

  #def self.create(name)
  #artist = self.new(name)
  #artist.name = name
  #artist.save
  #artist
  #end

  def find_or_create_by_name(name)
  #song = self.new
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
        end
      end

end
