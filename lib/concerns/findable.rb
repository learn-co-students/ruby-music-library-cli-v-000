module Concerns::Findable

  def destroy_all
    self.all.clear
  end

  def find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

end
