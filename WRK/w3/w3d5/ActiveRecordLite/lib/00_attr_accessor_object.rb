class AttrAccessorObject
  def self.my_attr_accessor(*names)

    # Needed to interpolate the name, otherwise, we'd be setting @name and not
    #     whatever the instance varialbe we anted

    # Creates getter methods
    names.each do |name|
      name = name.to_s
      define_method(name){
        self.instance_variable_get("@#{name}")
      }
    end

    # Creates setters for the variables
    names.each do |name|
      name = name.to_s
      define_method("#{name}=") do |var = nil|
        self.instance_variable_set("@#{name}", var)
      end
    end
  end

end
