require 'sinatra'
require 'slim'

root = File.dirname(File.absolute_path(__FILE__))

get '/' do
  slim :search
end

post '/result' do
  query = '''
    { "query": {
        "match": {
          "dc:description": "'''+params[:search_term]+'''"
        }
    }}'''
  slim :result, locals:{term:query}
end
