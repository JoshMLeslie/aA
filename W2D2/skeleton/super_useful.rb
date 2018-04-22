class CoffeeError < StandardError
end


# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = "apple" #gets.chomp
    reaction(maybe_fruit) # checks fruit
  rescue CoffeeError
    puts "coffee is delciious, but I want fruit too!"
    retry
  rescue StandardError
    puts "That's not a fruit! I'm not friendly anymore."
  end

end

# PHASE 4
class BestFriend
  attr_reader :yrs_known, :name, :fav_pastime

  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    check_input
  end

  def check_input
    check_years
    check_string(name)
    check_string(fav_pastime)
  end

  def check_years
    begin
      raise StandardError if yrs_known < 5
    rescue
      puts "ERROR: Best friends are like a fine wine. Supposedly."
    end
  end

  def check_string(input_string)
    begin
      raise StandardError unless input_string.is_a?(String) && input_string.length > 0
    rescue
      puts "ERROR: an input is not a string OR is empty."
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
