require 'spec_helper'

describe "Parse Java Version" do
  subject do
    JavaVersion.parse(version)
  end

  describe "given JDK7u40" do
    let(:version) { "JDK7u40" }
    it { expect(subject.family_number).to eq(7) }
    it { expect(subject.update_number).to eq(40) }
  end

  describe "given JDK6u51" do
    let(:version) { "JDK6u51" }
    it { expect(subject.family_number).to eq(6) }
    it { expect(subject.update_number).to eq(51) }
  end

  describe "given nil" do
    let(:version) { nil }
    it { expect { subject }.to raise_error(ArgumentError) }
  end

  describe "given JDK7u01" do
    let(:version) { "JDK7u01" }
    it { expect { subject }.to raise_error(ArgumentError) }
  end

  describe "given JDKVersion" do
    let(:version) { "JDKVersion" }
    it { expect { subject }.to raise_error(ArgumentError) }
  end

  describe "given JDK8uABC" do
    let(:version) { "JDK8uABC" }
    it { expect { subject }.to raise_error(ArgumentError) }
  end

  describe "given JDKVu80" do
    let(:version) { "JDKVu80" }
    it { expect { subject }.to raise_error(ArgumentError) }
  end
end
