require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "yard-restful"
    gem.summary = %Q{Yardoc plugin for Restful web services}
    gem.description = %Q{A customized plugin for Yardoc that produces API documentation for Restful web services}
    gem.email = ''
    gem.homepage = "https://github.com/kraft001/yard-restful"
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
  gemfilename = 'yard-restful-' + IO.read('VERSION').strip + '.gem'
  `rm yard-restful-*.gem`
  `gem uninstall yard-restful && \
   gem build yard-restful.gemspec && \
   gem install #{gemfilename}`
end

namespace :example do
  desc "Generate example docs"
  task :generate do
    puts `yardoc -e ./lib/yard-restful.rb --title "Example Books API" --readme ./example/API_README.md --markup markdown ./example/*.rb`
    # `x-www-browser ./doc/index.html`
    puts 'On success open ./doc/index.html or ./doc/frames.html in your preferred browser'
  end

  desc "Clean example docs"
  task :clean do
    `rm -R doc`
    `rm -R .yardoc`
    puts 'Done!'
  end
end
