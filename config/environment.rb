require 'bundler'
Bundler.require

module Concerns

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find_by_name(name)
    self.all.find {|item| item.name == name }
  end
end

require_all 'lib'
