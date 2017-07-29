module Concerns::Findable
  def find_by_name(name) #return value is found value or nil
    self.all.detect {|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def create(name)
    self.new(name).save
  end

end
