class StoreController < ApplicationController
  before_action :logged_in_staff
  require 'net/http'
  
  def index
    url = URI('https://api.scalablepress.com/v2/categories')
    array = Net::HTTP.get(url)
    @json = JSON.parse(array)
  end

  def order
  end
end
