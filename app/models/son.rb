class Son < Child
  extend Enumerize
  enumerize :gender, in: [:male]

  def say_something
    "Hello, I am your son."
  end
end