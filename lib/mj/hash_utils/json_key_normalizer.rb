# frozen_string_literal: true

module Mj
  class HashUtils
    class JsonKeyNormalizer
      def normalize(item_or_collection)
        KeyTransformer.new.transform(item_or_collection) do |key|
          camelize_key(key)
        end
      end

      # :reek:TooManyStatements
      def camelize_key(key)
        key = key.to_s
        key = key.sub(%r{^(?:(?=\b|[A-Z_])|\w)/}) { ::Regexp.last_match(0).downcase }
        key.gsub(%r{(?:_|(/))([a-z\d]*)}) do
          "#{Regexp.last_match(1)}#{Regexp.last_match(2).capitalize}"
        end.gsub("/", "::").to_sym
      end
    end
  end
end
