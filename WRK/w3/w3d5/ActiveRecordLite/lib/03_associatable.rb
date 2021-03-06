require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    self.class_name.to_s.constantize
  end

  def table_name
    # ...
    class_name.constantize.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
    self.foreign_key = name.to_s.foreign_key.to_sym
    self.class_name = name.to_s.classify

    self.primary_key = :id

    options.each do |key, val|
      key = key.to_s.concat("=").to_sym
      self.send(key, val)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    self.primary_key = :id
    self.class_name = name.to_s.classify
    self.foreign_key = self_class_name.foreign_key.to_sym

    options.each do |key, val|
      key = key.to_s.concat("=").to_sym
      self.send(key, val)
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    options = BelongsToOptions.new(name, options)
    p name
    define_method("#{name}".to_sym){
      foreign_key = options.foreign_key
      model_class = options.model_class
      hash = {options.primary_key => foreign_key}
      model_class.where(hash)
    }
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
