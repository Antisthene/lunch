class RestaurantsGathering
  require 'uri'
  require 'net/http'
  URL='https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/restaurants-casvp/records?limit=100'.freeze
  ERROR='Wrong request'.freeze

  attr_reader :data, :errors

  def initialize
    @data = []
    @errors = []
  end

  def gather
    begin
      http.use_ssl = true
      request["accept"] = 'application/json'
      response = http.request(request)
      @data = (JSON.parse(response.read_body) || {})['results']
    rescue
      @errors << ERROR 
    end
  end

  def fill
    return unless @data.present?

    @data.each do |rest|
      Restaurant.find_or_create_by(name: rest['nom_restaurant'],
        code: rest['code'],
        address: rest['adresse'],
        city: rest['ville'],
        lon: (rest['tt'] || {})['lon'],
        lat: (rest['tt'] || {})['lat'])
    end
  end

  private

  def http
    @http ||= Net::HTTP.new(url.host, url.port)
  end

  def url
    @url = URI(URL)
  end

  def request
    @request ||= Net::HTTP::Get.new(url)
  end
end
