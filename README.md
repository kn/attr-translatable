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
#=> "新しいブログポスト"
```
## Authors

* Katsuya Noguchi: http://github.com/katsuyan
