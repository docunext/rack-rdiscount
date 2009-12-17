require 'rubygems'
require '../lib/rack-rdiscount'

use Rack::RackDiscount


app = lambda { |env| [200, { 'Content-Type' => 'text/html' }, '**Hello World**'] }
run app
