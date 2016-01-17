module PostsHelper
	def currentDate
		time = Time.new
		d = time.day
		m = time.month
		y = time.year

		return "#{m} / #{d} / #{y}"
	end
end
