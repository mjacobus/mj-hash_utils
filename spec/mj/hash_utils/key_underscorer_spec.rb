# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mj::HashUtils::KeyUnderscorer do
  def underscorize(hash)
    Mj::HashUtils.new.underscorize_keys(hash)
  end

  describe "#underscorize" do
    it "handles simple hash keys" do
      hash = {
        fooBar: :baz
      }

      expected = {
        foo_bar: :baz
      }

      expect(underscorize(hash)).to eq(expected)
    end

    it "handles array" do
      hash = [
        { fooBar: :baz }
      ]

      expected = [
        { foo_bar: :baz }
      ]

      expect(underscorize(hash)).to eq(expected)
    end

    it "handles hash recursively" do
      hash = {
        key: :baz,
        firstKey: :baz,
        secondKey: {
          thirdKey: "third value"
        },
        "fourthKey" => [
          { fifthKey: "fifth value" }
        ]
      }

      expected = {
        key: :baz,
        first_key: :baz,
        second_key: {
          third_key: "third value"
        },
        fourth_key: [
          { fifth_key: "fifth value" }
        ]
      }

      expect(underscorize(hash)).to eq(expected)
    end

    it "handle array of hashes" do
      hash = {
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

      expected = {
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

      expect(underscorize(hash)).to eq(expected)
    end
  end
end
