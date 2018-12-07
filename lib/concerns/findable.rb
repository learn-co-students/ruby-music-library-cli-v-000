module Concerns::Findable
  # Module code here
  def find_by_name(name)
      self.all.find{|something|something.name == name}
  end

  def find_or_create_by_name(name)
      # a_Class=self.class
      find_by_name(name) || create(name)
  end
end
