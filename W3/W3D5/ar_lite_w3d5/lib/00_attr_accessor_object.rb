class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |set_var|
        self.instance_variable_set("@#{name}", set_var)
      end
    end
  end
end


=begin
class Bob
  my_attr_accessor(:name, ... )

  . . .
  . .
  .  .

end

bob.name = "Bob"
bob.name #=> "Bob"


=end
