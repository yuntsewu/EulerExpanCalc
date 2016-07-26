require "EulerExpanCalc/version"
require 'csv'
require "bigdecimal/math"
module EulerExpanCalc
  include BigMath #using the built in functions for Euler rule
  def calculatesNum(path)
    #find the file, import information to an object
    CSV.foreach(path) do |row| #row stores the information from each row of the csv
      throw :invalidFile if row.length != 2 #CSV should only contain 2 objects
      x = row[0].to_i #this will grab the first object, as X
      y = row[1].to_i #this will grab the second object, as Y
      puts calcNumber(x, y) #calculate the xth prime number or euler number expansion with length of Y
    end
  end
  def is_prime?(num)
    #this function checks if parameter is a prime number, and return boolean
    return false if num <= 1
    Math.sqrt(num).to_i.downto(2).each {
      |i| return false if num % i == 0
    }
    true
  end
  #the function will do a while loop
  #grabs next prime number until it's the nth prime number
  def calcNumber(nthPrime, chopLength)
    found = false #true when found nthPrime in eulers number expansion with length of chopLength
    pointer = 1 #starts at 1, so it skips the first number ('2'.718...)
    scope = chopLength
    chopEnd = chopLength
    listOfPrimes = Array.new
    while !found
      #loop through chops of numbers
      #need a variable to track location of pointer
      #builds the string to be analyzed
      scope = (BigMath::E(pointer+chopLength+1) * (10 ** (pointer+chopLength))).to_i.to_s
      #puts "we should have eulers number: " + scope #debug
      scope = scope[pointer,chopLength]
      #puts "we should have the just the length to analyze: " + scope
      #few conditions
      #need to skip if digits contains 0 in the begining to the next set
      #need to store this in a array to pick
      pointer += 1
      chopEnd = (pointer + 1) * chopLength
      if scope.to_i.to_s.length == chopLength
        if is_prime?(scope.to_i)
          listOfPrimes.push(scope)
        end
        found = is_prime?(scope.to_i) && listOfPrimes.length == nthPrime
      end
    end
    #puts listOfPrimes.to_s
    return listOfPrimes.last
  end
end
class EulerTask
  include EulerExpanCalc
end
