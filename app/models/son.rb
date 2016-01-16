class Son < Child
  # belongs_to :father, :class_name => 'Father', :foreign_key => 'father_id'

  extend Enumerize
  enumerize :gender, in: [:male]
end
