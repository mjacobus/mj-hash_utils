# frozen_string_literal: true

require_relative "hash_utils/version"
require_relative "hash_utils/deep_value_modifier"
require_relative "hash_utils/key_transformer"
require_relative "hash_utils/key_underscorer"
require_relative "hash_utils/json_key_normalizer"

module Mj
  class HashUtils
    def filter_keys(hash, *keys)
      keys = keys.flatten
      hash.select { |key, _value| keys.include?(key) }
    end

    def deep_symbolize_keys(hash)
      deep_transform_keys(hash, &:to_sym)
    end

    def deep_stringify_keys(hash)
      deep_transform_keys(hash, &:to_s)
    end

    def deep_transform_keys(hash, &block)
      KeyTransformer.new.transform(hash, &block)
    end

    def deep_modify_value(hash, &block)
      DeepValueModifier.new.modify(hash, &block)
    end

    def normalize_json_keys(hash)
      JsonKeyNormalizer.new.normalize(hash)
    end

    def compact(hash)
      hash.reject do |_key, value|
        !value || value == ""
      end
    end

    def underscorize_keys(hash, &block)
      KeyUnderscorer.new.underscorize(hash, &block)
    end
  end
end
