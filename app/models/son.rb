class Son < Child
  extend Enumerize
  enumerize :gender, in: [:male]

  def brothers
    father.sons.where.not(id: id)
  end

  def say_something
    "Hello, I am your son."
  end
end