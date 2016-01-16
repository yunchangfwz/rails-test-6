class Mother < Person
  has_many :children, class_name: 'Child', :foreign_key => 'mother_id'
  has_many :sons, -> (object) { merge(Son.where(gender: 'male')) }, class_name: Son, source: :children
  has_many :daughters, -> (object) { merge(Daughter.where(gender: 'female')) }, class_name: Daughter, source: :children

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
