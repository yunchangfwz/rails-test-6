class Father < Person
  has_many :children, class_name: 'Child', :foreign_key => 'father_id'
  has_many :sons, -> (object) { merge(Son.where(gender: 'male')) }, class_name: Son, source: :children
  has_many :daughters, -> (object) { merge(Daughter.where(gender: 'female')) }, class_name: Daughter, source: :children
  
  extend Enumerize
  enumerize :gender, in: [:male]

  MIN_AGE = 20

  def self.father_ids
    Person.where("father_id > 0").map(&:id)
  end

  def father_of?(person)
    self.children.include? person
  end

  def say_something
    "Hello, I am your father."
  end
end
