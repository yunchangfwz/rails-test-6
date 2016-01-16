class Person < ActiveRecord::Base
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :dob,         presence: true
  validate  :ensure_valid_age
  
  
  MIN_AGE = 0

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

  def parents
    Person.where("id= ? or id = ?",father_id, mother_id)
  end

  protected

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < self.class::MIN_AGE
  end

end
