class Father < Person
  has_many :children, class_name: 'Child', :foreign_key => 'father_id'
  # has_many :sons, class_name: 'Son', :foreign_key => 'father_id', though: :childs
  has_many :sons, -> (object) { merge(Son.where(gender: 'male')) }, through: :childs, class_name: Son, source: :sons

  # scope :all, -> { Person.where(id: ) }

  extend Enumerize
  enumerize :gender, in: [:male]

  MIN_AGE = 20

  def self.father_ids
    Person.where("father_id >0").map(&id)
  end

  def father_of?(person)
    self.children.include? person
  end

  def say_something
    "Hello, I am your father."
  end
end
