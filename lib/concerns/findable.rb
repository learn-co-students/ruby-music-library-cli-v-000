module Concerns::Findable #if you notice it has the foldername::module_name

  @@all = []

  def find_by_name(name)
    self.all.find {|object| object.name}
  end

  def find_or_create_by_name(name)
    self.all.find(-> {self.new(name).save}) {|object| object.name}
  end
end