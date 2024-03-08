# frozen_string_literal: true

module Mj
  class HashUtils
    class DeepValueModifier
      def modify(object, &block)
        {}.tap do |new_hash|
          object.each do |key, value|
            new_hash[key] = modify_value(value, &block)
          end
        end
      end

      private

      # :reek:ManualDispatch
      def modify_value(value, &block)
        if value.is_a?(::Hash)
          return modify(value, &block)
        end

        if value.respond_to?(:map)
          return value.map { |item| modify_value(item, &block) }
        end

        yield(value)
      end
    end
  end
end
