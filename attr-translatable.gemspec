require File.join(File.dirname(__FILE__), 'lib', 'attr_translatable', 'version')

Gem::Specification.new do |s|
  s.name = "attr-translatable"
  s.version = ::AttrTranslatable::VERSION
  s.authors = ["Katsuya Noguchi"]
  s.email = ["katsuya7s@gmail.com"]
  s.homepage = "https://github.com/katsuyan/attr-translatable"
  s.description = "attr-translatable gem allows attributes of ActiveRecord to be translated."

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.summary = "attr-translatable gem allows attributes of ActiveRecord to be translated."

  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'rake', ">=0.8.7"
  s.add_development_dependency 'rspec', "~>2.8"
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'database_cleaner', "~>0.7.1"
  s.add_development_dependency 'sqlite3', "~>1.3.5"

  s.require_path = 'lib'
  s.files = %w(LICENSE README.md Rakefile) + Dir.glob("{lib,spec}/**/*")
end
