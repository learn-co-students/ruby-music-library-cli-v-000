module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def create_by_name(name)
    instance = self.new(name)
    self.all << instance
    instance
  end

  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    if instance == nil
      instance = self.create_by_name(name)
    end
    instance
  end

end
