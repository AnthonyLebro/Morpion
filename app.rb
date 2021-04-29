require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/board_case'
require 'app/board'
require 'app/game'
require 'app/player'
require 'views/show'




@my_game = Game.new
@my_game.perform
