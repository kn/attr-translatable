# encoding: UTF-8

require 'active_record'
require 'database_cleaner'
require 'sqlite3'
require 'attr_translatable'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :attr_translations do |t|
    t.string      :translation
    t.string      :lang
    t.string      :attr
    t.references  :model, polymorphic: true
    t.timestamps
  end

  add_index :attr_translations, [:lang, :attr, :model_id, :model_type], unique: true, name: "index_attr_translations_on_attr_and_lang_and_model"

  create_table :posts do |t|
    t.string  :title
    t.string  :content
    t.integer  :votes
    t.string  :url
    t.timestamps
  end
end

class Post < ActiveRecord::Base
end
