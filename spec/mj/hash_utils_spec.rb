# frozen_string_literal: true

RSpec.describe Mj::HashUtils do
  it "has a version number" do
    expect(Mj::HashUtils::VERSION).not_to be_nil
  end

  describe "#filter_keys" do
    it "returns a new hash with the filtered keys" do
      input = {
        foo: :foo_value,
        baz: :baz_value,
        bar: :bar_value
      }

      expected_output = {
        foo: :foo_value,
        bar: :bar_value
      }

      output = subject.filter_keys(input, %i[foo bar])

      expect(output).to eq expected_output
    end

    it "takes also any number of arguments as keys" do
      input = {
        foo: :foo_value,
        baz: :baz_value,
        bar: :bar_value
      }

      expected_output = {
        foo: :foo_value,
        bar: :bar_value
      }

      output = subject.filter_keys(input, [:foo], :bar)

      expect(output).to eq expected_output
    end
  end

  describe "#compact" do
    it "rejects nil and blank values" do
      expected_output = {
        foo: :bar
      }

      input = {
        foo: :bar,
        baz: nil,
        bar: ""
      }

      expect(subject.compact(input)).to eq expected_output
    end
  end
end
