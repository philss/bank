require 'spec_helper'

describe Accounting do
  subject(:accounting) { described_class }

  describe '.sum' do
    subject(:sum) { accounting.sum(a, b) }

    let(:a) { 22 }
    let(:b) { 20 }

    it { is_expected.to eq(42) }
  end
end
