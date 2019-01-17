# 1/8/19  MUST UPDATE from artist-song modules lab

module Concerns::Findable

    def find_by_name(name)
      self.all.find {|x| x if x.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
end #module end
