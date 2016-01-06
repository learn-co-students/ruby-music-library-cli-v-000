module Concerns::Destroy_Create

  def destroy_all
    self.all=[]
  end

  def create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

end

module Concerns::Save
  def save
    self.class.all.push(self)
  end
end

module Concerns::Findable
  def find_by_name(name)
    self.all.detect{|instance| instance.name==name}
  end

  def find_or_create_by_name(name)
    result = self.all.detect{|instance| instance.name==name}
    return result if result
    self.create(name)
  end

end