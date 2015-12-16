module Concerns::Findable
  @@all = []
  def all
    @@all
  end
  
  def create(name)
    new_object = self.new(name)
    new_object.save
  end
  
  def destroy_all
    self.all.clear
  end
  

  
end

module Savable
  def save
    self.class.all << self
  end
end