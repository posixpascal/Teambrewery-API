# Pokemon Showdown Importer
# (C) posixpascal

require 'fileutils'
require 'open-uri'
require 'json'
require 'pathname'
require 'yaml'

class Showdown
    REPOSITORY = 'https://raw.githubusercontent.com/Zarel/Pokemon-Showdown-Client'
    REPOSITORY_SUFFIX = '/master/'
    TEMP_DIRECTORY = "showdown_data/"
    TARGET_DIRECTORY = "../db/showdown"
   def initialize()
       @files = default_files()
   end
   
   def crawl!
      repo = Showdown::REPOSITORY + Showdown::REPOSITORY_SUFFIX
      puts  "Showdown Importer: Starting to crawl JSON files from: #{Showdown::REPOSITORY}" 
      puts  "Directory: #{Showdown::REPOSITORY_SUFFIX}"
      print "==========="
      Showdown::REPOSITORY_SUFFIX.size.times do || print "=" end
      print "\n"
      puts "       Creating temporary       "
      puts "================================"
      
      FileUtils.rm_rf  Showdown::TEMP_DIRECTORY
      FileUtils.mkdir_p Showdown::TEMP_DIRECTORY
    
      @files.each do |group, files|
          files.each do |file|
              puts "Downloading: " + file
              
              begin
                  
                  open(build_uri(file)) do |gitfile|
                      puts "got connection to file..."
                      js_json = gitfile.read
                  
                      output = output_path(file, group)
                      FileUtils.mkdir_p File.dirname(output)

                  
                      open(output, 'w') do |outputfile|
                         outputfile.write js_json
                      end
                  end
                  puts "Downloaded: #{file}"
                  ("Downloaded: ".size + file.size).times do || print "=" end
                  print "\n"
                  
              rescue OpenURI::HTTPError
                  puts "Could not open file: " + file
                  puts "Continue to next file"
              end
              
          end
      end
      puts "Done. Converting js_json to raw JSON using node."
      node_cleanup!
      puts "Done. Creating seed.rb file..."
      move_to_seeds()
   end
   
   def move_to_seeds
      FileUtils.rm_rf Showdown::TARGET_DIRECTORY
      FileUtils.mv Showdown::TEMP_DIRECTORY, Showdown::TARGET_DIRECTORY 
      touch_seed_data()
   end
   
   def touch_seed_data
      data = Hash.new
      data[:files] = @files
      data[:target_directory] = File.expand_path(Showdown::TARGET_DIRECTORY)
      data[:temp_directory] = File.dirname(File.expand_path(__FILE__))
      File.open(File.expand_path(Pathname.new(Showdown::TARGET_DIRECTORY).join("../")) + "/showdown.yml", 'w') do |w|
         w.write data.to_yaml 
      end
      
      puts "Done! ~ see ya."
      
   end
   
   def set_files(files)
      @files = files
   end 
   
   private
   def node_cleanup!
       puts "Starting cleanup with node..."
       puts "Parameters: "
       puts "\t\t #{Showdown::TEMP_DIRECTORY}"
       puts "\t\t" "#{@files.to_json}"
       puts "\n"
       puts "Waiting for node to finish..."
       
       system("node", "showdown/cleanup.js",  "#{Showdown::TEMP_DIRECTORY}", "#{@files.to_json}")
   end
   
   def output_path(file, group)
       path = Pathname.new(Showdown::TEMP_DIRECTORY).join(group.to_s)
       path.to_path() + "/#{file}"
   end
   
   def build_uri(file)
      "#{Showdown::REPOSITORY}#{Showdown::REPOSITORY_SUFFIX}#{file}" 
   end

   
   def default_files()
       files = Hash.new
       files[:formats] = ['data/formats-data.js', 'data/formats.js']
       files[:abilities] = ['data/abilities.js']
       files[:items] = ['data/items.js']
       files[:moves] = ['data/moves.js']
       files[:learnsets] = ['data/learnsets.js']
       files[:pokedex] =  ['data/pokedex.js']
       files[:typechart] = ['data/typechart.js']
       files
   end
    
end