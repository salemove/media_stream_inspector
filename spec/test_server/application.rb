require 'sinatra'
require 'slim'

get '/' do
  slim :call_with_logging_on_one_page
end
