module Mechanics
	module Dice
		# I want access to this method outside of this file, hence the 'self.<insert>'
		def self.roll
			dice = []
			dice << rand(1..6) << rand(1..6)
		end
	end
end