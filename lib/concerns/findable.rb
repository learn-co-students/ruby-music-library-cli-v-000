module Concerns::Findable #find_by_name Instance method
  def find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def create(name)
    self.new(name).tap {|o| o.save}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
