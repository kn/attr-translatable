# encoding: UTF-8

class CreateAttrTranslations < ActiveRecord::Migration
  def self.change
    create_table :attr_translations do |t|
      t.text        :translation
      t.string      :lang
      t.string      :attr
      t.references  :model, polymorphic: true
      t.timestamps
    end

    add_index :attr_translations, [:lang, :attr, :model_id, :model_type], unique: true, name: "index_attr_translations_on_attr_and_lang_and_model"
  end
end
