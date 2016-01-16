class Daughter < Child
  extend Enumerize
  enumerize :gender, in: [:female]

  def say_something
    "hello I'm your daughter"
  end
end
