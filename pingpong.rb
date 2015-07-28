require 'httparty'
require 'sinatra'
require 'yaml'

conf = YAML.load(File.open('config.yml'))

BASE_URI = "#{conf['opponent']}:4567/ping"
AUTH = { username: conf['username'], password: conf['password'] }

def pong
  headers = { 'Content-Type' => 'application/json' }
  body = JSON.dump({ key: 'value', 
                     key1: 'value1', 
                     key2: 'value2', 
                     key3: 'value3' })
  options = { headers: headers, body: body, basic_auth: AUTH,  verify: false }
  results = HTTParty.post(BASE_URI, options)
end

pong if conf['initiator'] == true

get '/ping' do
  pong
end

