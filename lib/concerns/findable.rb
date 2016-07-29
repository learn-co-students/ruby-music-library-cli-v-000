module Concerns::Findable #if you notice it has the foldername::module_name

  def find_by_name(name)
    self.all.find {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    self.all.find(-> {self.new(name).save}) {|object| object.name == name}
  end
end