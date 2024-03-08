# frozen_string_literal: true

module Mj
  class HashUtils
    class KeyUnderscorer
      def underscorize(item_or_collection)
        KeyTransformer.new.transform(item_or_collection) do |key|
          underscorize_key(key)
        end
      end

      # :reek:TooManyStatements
      def underscorize_key(key)
        key = key.to_s
        key = key.gsub("::", "/")
        key = key.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        key = key.gsub(/([a-z\d])([A-Z])/, '\1_\2')
        key = key.tr("-", "_")
        key.downcase.to_sym
      end
    end
  end
end
