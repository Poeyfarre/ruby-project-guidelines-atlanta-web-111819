require 'rest-client'
require 'json'
require 'pry'
require 'digest'

def fetch_marvel(entry, offset = 0)
  public_key = ENV["PUBLIC_KEY"]
  private_key = ENV["PRIVATE_KEY"]
  time = Time.now
  hash_soup = time.to_s + private_key + public_key
  hash = Digest::MD5.hexdigest hash_soup
  # url_mine = "https://gateway.marvel.com/v1/public/characters?ts=#{time.to_s}&apikey=#{public_key}&hash=#{hash}"
  response = RestClient.get("https://gateway.marvel.com/v1/public/#{entry}?ts=#{time.to_s}&apikey=#{public_key}&hash=#{hash}&limit=100&offset=#{offset}")
  marv_response = JSON.parse(response)

  return marv_response
end

def fetch_comics(id_num)
  public_key = "5e8946f12e3dfaf42d0e54483983358e"
  private_key = "a449d1ddb8da13dfbd329ff8dc0d9747375a63e9"
  time = Time.now
  hash_soup = time.to_s + private_key + public_key
  hash = Digest::MD5.hexdigest hash_soup
  response = RestClient.get("http://gateway.marvel.com/v1/public/characters/#{id_num}/comics?ts=#{time.to_s}&apikey=#{public_key}&hash=#{hash}")
  marv_response = JSON.parse(response)

  return marv_response
end

def fetch_characters(id_num)
  public_key = "5e8946f12e3dfaf42d0e54483983358e"
  private_key = "a449d1ddb8da13dfbd329ff8dc0d9747375a63e9"
  time = Time.now
  hash_soup = time.to_s + private_key + public_key
  hash = Digest::MD5.hexdigest hash_soup
  response = RestClient.get("http://gateway.marvel.com/v1/public/comics/#{id_num}/characters?ts=#{time.to_s}&apikey=#{public_key}&hash=#{hash}")
  marv_response = JSON.parse(response)

  return marv_response
end

# binding.pry


