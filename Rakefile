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

# TODO find a way to keep Yaml in UTF-8. WTF??? I thought this was 2009.
def dump_yaml(lang)
  hash = {}
  get_matches.each do |m|
    hash[m.to_s] = strings[lang][m.to_s]
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