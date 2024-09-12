module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|word| word.name==name}
  end

  def create_by_name(name)
    object=self.new(name)
    object.name=name
    object.save
    object
  end

  def find_or_create_by_name(name)
    if 
      self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

end