class Person < ActiveRecord::Base
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :dob,         presence: true
  validates :gender,      presence: true
  validate  :ensure_valid_age
  
  # before_action :change_class
  
  
  MIN_AGE = 0

  def change_class
    becomes Father if is_father?
    becomes Mother if is_mother?
  end

  def is_father?
    true if Person.find_by(father_id: id).present?
  end

  def is_mother?
    true if Person.find_by(mother_id: id).present?
  end

  def age
    ((Date.today - dob) / 365).floor
  end

  def name
    first_name + " " + last_name
  end

  def say_something
    "hello I'm is " + self.name
  end

  def father_of?(person)
    false
  end
  
  def mother_of?(person)
    false
  end

  def brothers
    nil
  end

  def older_than(person)
    age - person.age
  end

  def parents
    Person.where("id= ? or id = ?",father_id, mother_id)
  end

  protected

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob.present? && age < self.class::MIN_AGE
  end

end
