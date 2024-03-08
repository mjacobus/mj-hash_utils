# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mj::HashUtils::KeyTransformer do
  def transform(hash)
    Mj::HashUtils.new.deep_transform_keys(hash) do |key|
      :"#{key}_transformed"
    end
  end

  describe "#transform" do
    it "handles simple hash keys" do
      hash = {
        foo_bar: :baz
      }

      expected = {
        foo_bar_transformed: :baz
      }

      expect(transform(hash)).to eq(expected)
    end

    it "handles array" do
      hash = [
        { foo_bar: :baz }
      ]

      expected = [
        { foo_bar_transformed: :baz }
      ]

      expect(transform(hash)).to eq(expected)
    end

    it "handles hash recursively" do
      hash = {
        key: :baz,
        first_key: :baz,
        second_key: {
          third_key: "third value"
        },
        fourth_key: [
          { fifth_key: "fifth value" }
        ]
      }

      expected = {
        key_transformed: :baz,
        first_key_transformed: :baz,
        second_key_transformed: {
          third_key_transformed: "third value"
        },
        fourth_key_transformed: [
          { fifth_key_transformed: "fifth value" }
        ]
      }

      expect(transform(hash)).to eq(expected)
    end

    it "handle array of hashes" do
      hash = {
        data: {
          id: :foo,
          the_strings: [
            "foo"
          ],
          contents: [
            {
              content_type: :foo
            }
          ]
        }
      }

      expected = {
        data_transformed: {
          id_transformed: :foo,
          the_strings_transformed: [
            "foo"
          ],
          contents_transformed: [
            {
              content_type_transformed: :foo
            }
          ]
        }
      }

      expect(transform(hash)).to eq(expected)
    end
  end
end
