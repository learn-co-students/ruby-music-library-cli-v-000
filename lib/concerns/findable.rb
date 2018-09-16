module Concerns::Findable

  def find_by_name(name)
    self.all.find {|x| x.name == name}
  end

  def find_or_create_by_name(name)
    finder = self.find_by_name(name)
    finder = self.create(name) unless finder != nil
    finder
  end
end
