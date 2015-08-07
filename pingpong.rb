require 'httparty'
require 'sinatra'

conf = YAML.load(File.open('config.yml'))

BASE_URI = "http://#{conf['opponent']}:4567/ping"
AUTH = { username: conf['username'], password: conf['password'] }

def pong
  headers = { 'Content-Type' => 'application/json' }
  body = JSON.dump({ key: 'value',
                     key1: 'value1',
                     key2: 'value2',
                     key3: 'value3' })
  options = { headers: headers, body: body, basic_auth: AUTH,  verify: false }
  begin
    results = HTTParty.post(BASE_URI, options)
  rescue Net::ReadTimeout
    nil
  end
end

post '/ping' do
  sleep 5
  pong
end
