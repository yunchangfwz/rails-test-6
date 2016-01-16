class Child < Person
  belongs_to :father, :class_name => 'Father', :foreign_key => 'father_id'
  belongs_to :mother, :class_name => 'Mother', :foreign_key => 'mother_id'

  def say_something
    "hello I'm is a child"
  end

end
