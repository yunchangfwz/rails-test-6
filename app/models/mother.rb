class Mother < Person
  has_many :children, class_name: 'Child', :foreign_key => 'mother_id'

  extend Enumerize
  enumerize :gender, in: [:female]

  MIN_AGE = 18

  def mother_of?(person)
    self.children.include? person
  end

  def say_something
    "Hello, I am your mother."
  end
end
