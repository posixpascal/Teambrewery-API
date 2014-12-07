# showdown importer
# (C) posixpascal

require_relative 'showdown/showdown.rb'

Dir.chdir(File.dirname(__FILE__))

crawler = Showdown.new()
crawler.crawl!