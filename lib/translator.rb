require 'pry'
require 'yaml'

def load_library(library)
  emote_hash = YAML.load_file(library)
  hash_with_language = {}
  emote_hash.each do |key, value|
    inner_hash = {:english => value[0], :japanese => value[1]}
    hash_with_language[key] = inner_hash
  end 
  hash_with_language
end

def get_japanese_emoticon(library, emoticon)
  english_emoticon = nil 
   load_library(library).each do |key, value|
    if emoticon == value[:english]
      english_emoticon = value[:japanese] 
    end
  end 
  
  if english_emoticon == nil 
    return "Sorry, that emoticon was not found"
  else 
    return english_emoticon 
  end 
end

def get_english_meaning(library, emoticon)
  
  english_translation = nil 

  load_library(library).each do |key, value|
    if emoticon == value[:japanese]
      english_translation = key
    end 
  end 
  if english_translation == nil 
    return "Sorry, that emoticon was not found"
  else 
    return english_translation
  end 
end

