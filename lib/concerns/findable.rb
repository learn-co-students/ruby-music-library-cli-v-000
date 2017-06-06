module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|objekt| objekt.name == name}
  end

  def new_by_name(name)
    self.new(name)
  end

  def find_or_create_by_name(name)
    self.name != name
    self.find_by_name(name) || self.new_by_name(name).tap{|s| s.save}
  end
end
