class Daughter < Child
  extend Enumerize
  enumerize :gender, in: [:female]

  def daughters
    father.daughters.where.not(id: id)
  end
  
  def say_something
    "Hello, I'm your daughter"
  end
end
