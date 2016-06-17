require "test_helper"

describe Dataset do
  let(:dataset) { Dataset.new }

  it "must be valid" do
    value(dataset).must_be :valid?
  end
end
