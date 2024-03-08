# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mj::HashUtils::JsonKeyNormalizer do
  def normalize(hash)
    Mj::HashUtils.new.normalize_json_keys(hash)
  end

  describe "#normalize" do
    it "handles simple hash keys" do
      hash = {
        foo_bar: :baz
      }

      expected = {
        fooBar: :baz
      }

      expect(normalize(hash)).to eq(expected)
    end

    it "handles array" do
      hash = [
        { foo_bar: :baz }
      ]

      expected = [
        { fooBar: :baz }
      ]

      expect(normalize(hash)).to eq(expected)
    end

    it "handles hash recursively" do
      hash = {
        key: :baz,
        first_key: :baz,
        second_key: {
          third_key: "third value"
        },
        "fourth_key" => [
          { fifth_key: "fifth value" }
        ]
      }

      expected = {
        key: :baz,
        firstKey: :baz,
        secondKey: {
          thirdKey: "third value"
        },
        fourthKey: [
          { fifthKey: "fifth value" }
        ]
      }

      expect(normalize(hash)).to eq(expected)
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
        data: {
          id: :foo,
          theStrings: [
            "foo"
          ],
          contents: [
            {
              contentType: :foo
            }
          ]
        }
      }

      expect(normalize(hash)).to eq(expected)
    end
  end
end
