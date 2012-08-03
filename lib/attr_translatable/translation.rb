# encoding: UTF-8

module AttrTranslatable
  module Translation

    def update_translation(attr, lang, translation)
      new_translation(attr, lang, translation).save
    end

    def translate(attr, lang)
      internal_translate(attr, lang)
    end
    
    def t(attr, lang)
      internal_translate(attr, lang)
    end

    private
      
      def new_translation(attr, lang, translation)
        attr, lang = [attr.to_s, lang.to_s]
        validate_attr(attr)
        at = AttrTranslation.find_or_initialize_by_attr_and_lang_and_model_id_and_model_type(attr, lang, self.id, self.class.name)
        at.translation = translation
        at
      end
      
      def internal_translate(attr, lang)
        attr, lang = [attr.to_s, lang.to_s]
        validate_attr(attr)
        at = AttrTranslation.select(:translation).where(attr: attr, lang: lang, model_id: self.id, model_type: self.class.name).first
        at ? at.translation : self.send(attr)
      end

      def validate_attr(attr)
        raise ArgumentError, "#{attr} is not translatable attribute." unless self.class.valid_translatable_attrs.include?(attr)
      end
  end
end
