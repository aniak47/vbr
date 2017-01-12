class StoreController < ApplicationController
  before_action :logged_in_staff
  require 'net/http'
  
  def index
    #url = URI('https://api.scalablepress.com/v2/categories')
    #array = Net::HTTP.get(url)
    #@json = JSON.parse(array)
    
    
    uri = URI.parse('https://api.scalablepress.com/v2/design/5870001e3f015b8579f8945c')
    # @products = Net::HTTP.new(produrl)
    req = Net::HTTP::Get.new(uri)
    req.basic_auth '', 'test_9mKVUq18F2aktJ0Sihdpkw'
    @json = JSON.parse(req)
    
  end

  def order
  end
end
