require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    # ...
    # through_options = self.assoc_options[through_name]
    # define_method(name) do
    #   source_class = through_options.model_class
    #   source_options = source_class.assoc_options[source_name]
    #
    # end
  end
end
