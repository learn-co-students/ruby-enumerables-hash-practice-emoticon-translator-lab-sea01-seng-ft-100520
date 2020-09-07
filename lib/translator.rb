# require modules here
require "yaml"
require 'pry'
def load_library(files)
  ret_hash = {}
  file = YAML.load_file(files)  
  file.each do |k, v|
    ret_hash[k] = {:english => v[0], :japanese => v[1]}    
  end  
  ret_hash
end

def get_japanese_emoticon(file, icon)
  lib = load_library(file)  
  return "Sorry, that emoticon was not found" unless lib.any? {|h, k| k[:english] == icon}
  lib.values.each do |k,v|    
    return k[:japanese] if k[:english].eql?(icon)
  end
end

def get_english_meaning(file, icon)
  lib = load_library(file)
  return "Sorry, that emoticon was not found" unless lib.any? {|h, k| k[:japanese] == icon} 
  lib.each do |k,v|  
    return k if v[:japanese].eql?(icon)
  end
end