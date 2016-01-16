class Daughter < ActiveRecord::Base
  belongs_to :father, :class_name => 'Father', :foreign_key => 'father_id'

  extend Enumerize
  enumerize :gender, in: [:female]

  def say_something
    "hello I'm your aughter"
  end

end
