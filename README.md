## attr-translatable

attr-translatable gem allows you to translate string attributes of your ActiveRecord.

## Installation

Add to Gemfile

```ruby
gem 'attr-translatable', :require => 'attr_translatable'
```

Run:
```ruby
bundle install
rails g attr_translatable
rake db:migrate
```

## Usage Example

```ruby
class Post < ActiveRecord
  attr_accessible :title, :content, :author
  attr_translatable :title, :content
end

@post = Post.create(
  title: "New Blog Post",
  content: "attr-translatable is awesome!",
  author: "Katsuya Noguchi"
)

@post.update_translation(:title, :ja, "新しいブログポスト")
@post.translate(:title, :ja)
# => "新しいブログポスト"

@post.t(:title, :ja)
# => "新しいブログポスト"

@post.translated_all?(:ja)
# => false
```

## Define Translatable Attributes

You can define translatable as shown below. All translatable attributes must be a string.

```ruby
attr_translatable :attr_name1, :attr_name2, ...
```

## Add/Update Translation

```ruby
update_translation(attr_name, lang, translation)
```

## Translate Attributes

```ruby
translate(attr_name, lang)
# or you can use shorten version:
t(attr_name, lang)
```

## Access Translatable Attributes Name

```ruby
ActiveRecord::Base.translatable_attrs
# => ["attr1", "attr2", ...]
# For example,
Post.translatable_attrs
# => ["title", "content"]
```
## Authors

* Katsuya Noguchi: http://github.com/katsuyan
