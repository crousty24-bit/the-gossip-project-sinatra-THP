require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'controller'
run ApplicationController

# use cmd $rackup -p 4567 to change default rack port to conventionnal Sinatra port
# when using cmd rerun:  $rerun "rackup -p 4567"
# gem rerun allow to refresh last modifications on the same port = restarts program