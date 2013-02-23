require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'

require 'uri'
require 'net/http'
require 'json'

root = File.dirname(File.absolute_path(__FILE__))

get '/' do
  search_fields = {"Autor"=>"dc:creator", "Titel"=>"dc:title", "Thema"=>"dc:subject", "Beschreibung"=>"dc:description"}
  slim :search, locals:{search_fields:search_fields}
end

post '/result' do
  query = {"query" => { "match" => { params[:search_field] => { "query" => params[:search_term],
      "operator" => "and" }}}}.to_json
  
  uri = URI.parse("http://localhost:9200/ukoeln/_search")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type'=>'application/json'})
  request.body = query
  response = http.request(request)

  results = JSON.parse(response.body)["hits"]["hits"]

  slim :result, locals:{results:results}
end
