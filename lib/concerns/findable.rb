

module Concerns::Findable
  def find_by_name(string)
    self.all.detect{|inst| inst.name == string}
  end

  def find_or_create_by_name(string)
    self.find_by_name(string) || self.create(string)
  end
end