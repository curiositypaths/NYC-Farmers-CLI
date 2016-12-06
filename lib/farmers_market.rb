class FarmersMarket

  attr_accessor :accepts_health_bucks, :borough, :day_s, :distribute_health_bucks, :ebt, :hours, :market_name, :stellar, :street_address

  ALL = []

  #DAYS_OF_THE_WEEK = ["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]
  DAYS_OF_THE_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

  #THRUGH

  def initialize(attributes)
    # attributes.each {|key, value| self.send(("#{key}="), value)}
    attributes.each do |key, value|
      self.send(("#{key}="), value)
    end
    #clean_up_day_data
    ALL << self
  end

  # First we have a string
  # we want to find all instances that are a range w/in that string
  # we don't care about anything else
  # once we have our ranges, we want out to figure out the start day
  # and the finsih day
  # and then determine if our SPECIAL day falls w/in that range

  def self.does_day_fall(string, day)
  	if string.include?("-")
	    array_of_days = string.split(" ")
	    ranges = array_of_days.select{|day| day.include?("-")}
	    dayified = ranges.collect {|range| range.split("-")}
	    r = dayified.first
	    #binding.pry
	    first_day_index = DAYS_OF_THE_WEEK.index(r[0])
	    last_day_index = DAYS_OF_THE_WEEK.index(r[1])
	    chosen_days_index = DAYS_OF_THE_WEEK.index(day)
	    true if chosen_days_index < last_day_index && chosen_days_index > first_day_index
	    else
	    	return false
	   end
  end



  # def clean_up_day_data
  #   days_array = []
  #   DAYS_OF_THE_WEEK. each do |day|
  #     if day_s.include?(day)
  #       day_s.sub(day,'')
  #       days_array << day
  #       puts "I added #{day} to the list of days I am open"
  #     end
  #     if day_s.include?("-")
  #       puts "I found a range"
  #       puts "This is what my day's data looks like now '#{day_s}'"
  #       @range_start_day = days_array.last
  #       day_s.sub('-','')
  #       DAYS_OF_THE_WEEK.find do |day|
  #         if day_s.include?(day)
  #           day_s.gsub(day,'')
  #           days_array << day
  #           puts "I found end day of the range. It's #{day}"
  #           @range_start_day = day
  #         end
  #       end
  #     end
  #   end
  #   # DAYS_OF_THE_WEEK.each do |day|
  #   #   if day_s.index(day)
  #   #     lenght_of_word = day.length + day_s.index(day)
  #   #     if day_s[lenght_of_word] == '-'
  #   #       find_day_for_range
  #   #     end
  #   #   end
  #   # end
  # end

  def find_day_for_range

  end

  def self.all
    ALL
  end

  def self.find_by_borough(borough)
    self.all.select do |farmers_market|
      farmers_market.borough.downcase == borough.downcase
    end
  end

  def self.find_by_day(day)
    self.all.select do |farmers_market|
    	days = farmers_market.day_s
      days.downcase.include?(day.downcase) || self.does_day_fall(days,day)
    end
  end

  def about_me
    puts "#{market_name} in #{borough} opened on #{hours}"
  end

end
