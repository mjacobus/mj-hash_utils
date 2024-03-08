# frozen_string_literal: true

require "spec_helper"

RSpec.describe Mj::HashUtils::DeepValueModifier do
  let(:utils) { Mj::HashUtils.new }

  let(:value) do
    Class.new do
      attr_reader :value

      def initialize(value)
        @value = value
      end
    end
  end

  it "modifies all the hash values" do
    hash = {
      one: value.new(:two),
      three: [value.new(:four)],
      five: [
        { six: value.new(:seven) }
      ],
      eight: { nine: value.new(:ten) }
    }

    new_hash = utils.deep_modify_value(hash, &:value)

    expected_hash = {
      one: :two,
      three: [:four],
      five: [
        { six: :seven }
      ],
      eight: { nine: :ten }
    }

    expect(new_hash).to eq(expected_hash)
  end
end
