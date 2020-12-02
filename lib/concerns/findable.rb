module Concerns::Findable
    
    def find_by_name(name)
        self.all.find{|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
        return self.find_by_name(name) || self.create(name)
    end
end