# encoding: UTF-8

module AttrTranslatable
  module Base
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def attr_translatable(*args)
        attrs = validate_attrs(args)
        unless ancestors.include?(AttrTranslatable::Translation)
          @translatable_attrs = attrs
          has_many :attr_translations, :as => :model, :dependent => :destroy
          include AttrTranslatable::Translation
        end
      end

      def translatable_attrs
        @translatable_attrs || []
      end

      private
        
        def validate_attrs(attrs)
          valid_attrs = self.new.attributes.keys
          attrs.map do |a|
            a = a.to_s
            raise ArgumentError, "#{a} is not an attribute of #{self.name}." unless valid_attrs.include?(a)
            type = columns.find { |c| c.name == a }.type
            raise ArgumentError, "#{a} has a #{type} type. Only a string type can be translatable." unless [:string, :text].include? type
            a
          end
        end

    end
  end
end
