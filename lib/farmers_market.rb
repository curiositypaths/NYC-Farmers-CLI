class FarmersMarket
  attr_accessor :accepts_health_bucks, :borough, :day_s, :distribute_health_bucks, :ebt, :hours, :market_name, :stellar, :street_address

  ALL = []
  DAYS_OF_THE_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]


  def initialize(attributes)
    attributes.each do |key, value|
      self.send(("#{key}="), value.strip)
    end
    ALL << self
  end

  def self.all
    ALL
  end

  def self.day_within_range?(string, day)
  	if string.include?("-")
	    array_of_days = string.split(" ")
	    ranges = array_of_days.select{|day| day.include?("-")}
	    array_of_ranges = ranges.collect {|range| range.split("-")}
	    find_day_within_range(day, array_of_ranges)
	  end
  end

  def self.find_day_within_range(day, array_of_ranges)
  	array_of_ranges.any? do |range|
  		start_index = week_index(range[0])
  		end_index = week_index(range[1])
  		chosen_days_index = week_index(day)
  		chosen_days_index < end_index && chosen_days_index > start_index
		end
  end

  def self.week_index(day)
  	DAYS_OF_THE_WEEK.index(day)
  end

  def self.find_by_borough(borough)
    self.all.select do |farmers_market|
      farmers_market.borough.downcase == borough.downcase
    end
  end

  def self.list_of_boroughs
    self.all.collect do |farmers_market|
      farmers_market.borough
    end.uniq
  end

  def self.count_by_boroughs
  	boroughs_stats = {}
    self.list_of_boroughs.each do |borough|
    	boroughs_stats[borough] = self.find_by_borough(borough).count
    end
		boroughs_stats
  end

  def self.find_by_day(day)
    self.all.select do |farmers_market|
    	days = farmers_market.day_s
      days.downcase.include?(day.downcase) || self.day_within_range?(days,day)
    end
  end

  def about_me
    "#{market_name} in #{borough}\nLocated at: #{street_address}\nOpened #{hours} on #{day_s}\n\n"
  end

end
