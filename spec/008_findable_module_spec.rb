require 'spec_helper'

describe 'Findable' do
  it 'defines a module Findable' do
    expect(defined?(Findable)).to be_truthy
    expect(Findable).to be_a(Module)
  end

  class Person
    extend Findable
  end

  it 'adds a find_by_name class method to classes that are extended by the module' do
    expect(Person).to respond_to(:find_by_name)
  end

  it 'adds a find_or_create_by_name class method to classes that are extended by the module' do
    expect(Person).to respond_to(:find_or_create_by_name)
  end
end
