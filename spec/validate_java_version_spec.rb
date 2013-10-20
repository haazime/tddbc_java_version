require 'spec_helper'

describe "Validate Java Version" do
  subject do
    JavaVersion.valid?(version)
  end

  describe "given JDK7u40" do
    let(:version) { "JDK7u40" }
    it { expect(subject).to be_true }
  end

  describe "given foo" do
    let(:version) { "foo" }
    it { expect(subject).to be_false }
  end

  describe "given JDK7u9x" do
    let(:version) { "JDK7u9x" }
    it { expect(subject).to be_false }
  end

  describe "given JDK123u0" do
    let(:version) { "JDK123u0" }
    it { expect(subject).to be_true }
  end
end
