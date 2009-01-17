require 'rake'

require 'l18n'
include L18n

desc "Run unit tests"
task "test" do
  sh "ruby test.rb"
end

desc "Show all strings avaialable to be translated"
task :strings do
  get_matches.each do |m|
    puts "\"#{m}\":"
  end
end

desc "Get Spanish file including already translated strings"
task :spanish do
  dump_yaml("es")
end

desc "Get English file including already translated strings"
task :english do
  dump_yaml("en")
end

# If the hash has sorted each, its YAML represention will also be sorted.
def hash_with_sorted_each
  hash = Hash.new
  def hash.each(&block); keys.sort.each { |k| yield k, self[k] }; end
  hash
end

# TODO find a way to keep Yaml in UTF-8. WTF??? I thought this was 2009.
def dump_yaml(lang)
  hash = hash_with_sorted_each # for nicer YAML output
  get_matches.each do |m|
    hash[m.to_s] = get_string(m.to_s, lang)
  end
  puts hash.to_yaml
end

def get_matches
  matches = []
  Dir['views/**/*.*'].each do |file|
    string = IO.read file
    matches += string.scan(/\<\%\=\s?s\(["|'](.+?)['|"]\)\s?\%\>/m)
  end
  matches.sort!
  matches.uniq
end
