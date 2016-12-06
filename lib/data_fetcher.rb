class DataFetcher
	URL = "https://data.cityofnewyork.us/resource/cdpt-29ur.json"

	def self.load
		response = RestClient.get(URL)
    data = JSON.parse(response)
    data.each do |farmers_market|
      FarmersMarket.new(farmers_market)
    end
	end

end
