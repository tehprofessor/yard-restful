require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "yard-restful"
    gem.summary = %Q{A customized plugin for Yardoc that produces API documentation for Restful web services}
    gem.description = %Q{A customized plugin for Yardoc that produces API documentation for Restful web services}
    gem.email = ''
    gem.homepage = "https://github.com/kraft/yard-restful"
    gem.authors = ['Konstantin Rafalsky']
    gem.add_dependency("yard", '~>0.8.3')
    gem.files = Dir.glob("{lib,templates}/**/*").concat(["Rakefile"])
    gem.extra_rdoc_files = ['VERSION', 'README.markdown']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc "Rebuild the gem from the gemspec"
task :rebuild do
  gemfilename = 'yard-restful-' + File.open('VERSION').gets.strip + '.gem'
  `rm yard-restful-*.gem`
  `gem uninstall yard-restful&& \
   gem build yard-restful.gemspec && \
   gem install #{gemfilename}`
end

