# encoding: UTF-8

require 'attr_translatable/base'
require 'attr_translatable/translation'
require 'models/attr_translation'

ActiveRecord::Base.send(:include, AttrTranslatable::Base)
