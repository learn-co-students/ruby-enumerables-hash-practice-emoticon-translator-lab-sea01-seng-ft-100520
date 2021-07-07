# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  translator = emoticons.each_with_object({}) do |key, dictionary|
        dictionary[key[0]] = {english: "", japanese: ""}
        dictionary[key[0]][:english] = key[1][0]
        dictionary[key[0]][:japanese] = key[1][1]
    end
    translator
end

def get_japanese_emoticon(file_path, emoticon)
  japanese_emoticon = "Sorry, that emoticon was not found"
  translator = load_library(file_path)
  translator.each do |entry|
    if emoticon === entry[1][:english]
      japanese_emoticon = entry[1][:japanese]
    end
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  english_meaning = "Sorry, that emoticon was not found"
  translator = load_library(file_path)
  translator.each do |entry|
    if emoticon === entry[1][:japanese]
      english_meaning = entry[0]
    end
  end
  english_meaning
end