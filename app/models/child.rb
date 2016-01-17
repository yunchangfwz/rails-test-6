class Child < Person
  belongs_to :father, :class_name => 'Father', :foreign_key => 'father_id'
  belongs_to :mother, :class_name => 'Mother', :foreign_key => 'mother_id'

  validates :father_id,  presence: true
  validates :mother_id,  presence: true
  validates :last_name,  presence: true
  validate  :age_smaller_than_parent

  extend Enumerize
  enumerize :gender, in: [:male, :female]

  def say_something
    "Hello, I'm is a child"
  end

  protected

  def age_smaller_than_parent
    if father_id.present?
      father = Father.find(father_id)
      return errors[:age] << 'Invalid.' if father_id.present? && father.older_than(self) >= Father::MIN_AGE
    end
  end
end
