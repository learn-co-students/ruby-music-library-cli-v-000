module Nameable

  extend ExtendMore

  module ClassMethods
    def create(name)
      self.new.tap do |o| #tap method returns the new instance of class itself, for ex. for Song clas it will create a new song by mane and will return that song at the end.
        o.name = name
        o.save
        o
      end
  end
end
end
