require 'bundler'
Bundler.require
#elles appellent le bundler et permettent de lire le Gemfile
#require 'sinatra'

$:.unshift File.expand_path("./../lib", __FILE__)
#contient les informations nécessaires au lancement de notre serveur.
require 'controller'
run ApplicationController