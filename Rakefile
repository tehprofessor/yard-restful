require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "yard-rest"
    gem.summary = %Q{A customized plugin for Yardoc that produces API documentation for Restful web services}
    gem.description = %Q{A customized plugin for Yardoc that produces API documentation for Restful web services}
    gem.email = ''
    gem.homepage = "https://github.com/spape/yard-rest-plugin"
    gem.authors = ['R. Kevin Nelson', 'Aisha Fenton', 'Sebastian Pape']
    gem.add_dependency("yard", '~>0.8.1')
    gem.files = Dir.glob("{lib,example,templates}/**/*").concat(["Rakefile"])
    gem.extra_rdoc_files = ['VERSION', 'README.markdown']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc "Rebuild the gem from the gemspec"
task :rebuild do
  gemfilename = 'yard-rest-' + File.open('VERSION').gets.strip + '.gem'
  `rm yard-rest-*.gem`
  `gem uninstall yard-rest&& \
   gem build yard-rest.gemspec && \
   gem install #{gemfilename}`
end

namespace :ex do
  desc "Generate example docs"
  task :generate do
    `yardoc 'example/app/controllers/examples_controller.rb' -e ./lib/yard-rest.rb --title "Our App's API" --readme "example/doc/README_FOR_API"`
  end

  desc "Clean example docs"
  task :clean do
    `rm -R doc`
    `rm -R .yardoc`
  end
end
