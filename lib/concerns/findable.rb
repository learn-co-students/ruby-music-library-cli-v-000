module Concerns::Findable
    def find_by_name(name)
        self.all.find {|a| a.name == name}
    end

    def save
        self.all << self
    end

    def create(name)
        a = self.new(name)
        a.save
        a
    end

    def find_or_create_by_name(name)
        find_by_name(name) ? find_by_name(name) : create(name)
    end
end
