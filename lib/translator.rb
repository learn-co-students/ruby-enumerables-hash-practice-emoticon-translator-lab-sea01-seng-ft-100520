require "yaml"

def load_library(file_path)
  new_hash = {}
  YAML.load_file(file_path).each do |k, v|
    new_hash[k] = {
      :english => v[0],
      :japanese => v[1]
    }
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emote_hash = load_library(file_path)
  emote_hash.each do |k, v|
    if emote_hash[k][:english] == emoticon
      return emote_hash[k][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

 def get_english_meaning(file_path, emoticon)
   emote_hash = load_library(file_path)
   emote_hash.each do |k, v|
     if emote_hash[k][:japanese] == emoticon
       return k
     end
   end
   return "Sorry, that emoticon was not found"
 end
