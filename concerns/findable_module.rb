module Concerns::Findable

  def find_by_name(name)
      self.all.find do |song|
         song.name==name
      end
  end

  def find_or_create_by_name(name)
    song=self.find_by_name(name)
    if song!=nil
      song
    else
     song=self.new(name)
      self.all<<song
    end
    song
  end

end