
class CLI

  URL = "https://data.cityofnewyork.us/resource/cdpt-29ur.json"


  def call
    puts "Hello!"
    # make farmers market objects
    response = RestClient.get(URL)
    data = JSON.parse(response)
    data.each do |farmers_market|
      FarmersMarket.new(farmers_market)
    end
    puts "Hello, we loaded all the NYC Farmers Markets. What borough would you like to search?"
    borough = gets.strip
    borough_markets = FarmersMarket.find_by_borough(borough)
    borough_markets.each do |market|
      market.about_me
    end
    binding.pry

    # Get information from user
    # santize info
    #
  end

end
