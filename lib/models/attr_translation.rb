# encoding: UTF-8

class AttrTranslation < ActiveRecord::Base
  belongs_to :model, :polymorphic => true

  attr_accessible :translation, :lang, :attr, :model_id, :model_type

  validates :attr, :uniqueness => { :scope => [:lang, :model_id, :model_type] }
end
