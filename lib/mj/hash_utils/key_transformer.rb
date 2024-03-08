# frozen_string_literal: true

module Mj
  class HashUtils
    # :reek:TooManyStatements
    class KeyTransformer
      def transform(item_or_collection, &block)
        if item_or_collection.is_a?(Array)
          return apply_to_collection(item_or_collection, &block)
        end

        return item_or_collection unless item_or_collection.is_a?(::Hash)

        new_hash = deep_transform_keys(item_or_collection, &block)

        new_hash.each do |key, value|
          if value.is_a?(Array)
            new_hash[key] = transform(value, &block)
          end
        end
      end

      def apply_to_collection(collection, &block)
        collection.map do |item|
          transform(item, &block)
        end
      end

      def deep_transform_keys(hash, &block)
        result = {}
        hash.each do |key, value|
          new_value = value.is_a?(::Hash) ? transform(value, &block) : value
          result[yield(key)] = new_value
        end
        result
      end
    end
  end
end
