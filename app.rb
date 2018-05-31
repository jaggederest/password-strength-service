#!/usr/bin/env ruby

require 'sinatra'

set :haml, :format => :html5

get '/examples/' do
  haml :examples
end

get '/password/*' do
  case Zlib::Deflate.deflate(params['splat'].to_s, 9).length
  when (0..25)
    ['bad']
  when (25..30)
    ['ok']
  when (30..10000)
    ['good']
  else
    [404, '']
  end
end