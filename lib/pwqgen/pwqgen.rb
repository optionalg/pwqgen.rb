require 'rubygems'
require 'pwqgen/wordlist'

module Pwqgen
		class Generator
			def initialize
				@@wordlist_size = @@wordlist.length
				@@separators = "-_!$&*+=23456789".split(//)
				@@separators_size = @@separators.length
				@length = 3
				@rand = Random.new
			end

			def generate(length = @length)
				output = Array.new
				for i in 1..length
					output << @@wordlist[@rand.rand(@@wordlist_size)]
					output[i-1] = output[i-1].capitalize if @rand.rand(2)

					output << @@separators[@rand.rand(@@separators_size)] unless i == length
				end
				output.join
			end
		end
end