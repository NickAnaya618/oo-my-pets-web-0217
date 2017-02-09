class Owner
  attr_accessor :owner, :fish, :cat, :dog, :name, :pets
  attr_reader :species, :name

  @@all = []
  @@owner_count = 0

  def initialize(name)
    @name = name
    @@owner_count += 1
    @species = "human"
    @@all << self
    @pets = {fishes: [], dogs: [], cats: [] }
  end

  def self.all
    @@all
  end

  def self.reset_all
    all.clear
    @@owner_count = @@all.length
  end

  def self.count
    @@owner_count
  end

  def say_species
    return "I am a #{species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.map do |animal, pet_array|
      pet_array.map do |pet|
        pet.mood = "nervous"
      end
    end
    self.pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    return "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
