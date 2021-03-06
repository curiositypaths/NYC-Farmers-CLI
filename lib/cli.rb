class CLI
	attr_accessor :list_of_markets, :market_by_day
	def call
    welcome_message
    load_markets_data
    display_count_of_markets_by_borough
    borough = get_user_borough_selection
    self.list_of_markets = FarmersMarket.find_by_borough(borough)
    display_market_info(list_of_markets)
    day = get_user_day_selection
    self.market_by_day = FarmersMarket.find_by_day(day)
    chosen_markets = market_by_day & list_of_markets
    display_market_info(chosen_markets)
  end

  def load_markets_data
  	DataFetcher.load
  end

  def get_user_borough_selection
  	puts "What borough would you like to find farmers markets in?"
  	borough = gets.strip
  end

  def get_user_day_selection
  	puts "\n\nWhat day do you want to shop for delicious vegetables?"
  	day = gets.strip
  end

  def display_market_info(market_list)
   	market_list.each do |market|
      puts market.about_me
    end
   end

  def new_line
  	puts "\n"
  end

  def welcome_message
  	puts "Hello, welcome back to 2012. We can tell you all things about finding locally sourced foods in NYC"
  	new_line
  end

  def display_count_of_markets_by_borough
  	puts "We found #{FarmersMarket.all.count} markets.\n"
  	FarmersMarket.count_by_boroughs.each do |key,value|
  		puts "#{value} in #{key}"
  	end
  	new_line
  end

end
