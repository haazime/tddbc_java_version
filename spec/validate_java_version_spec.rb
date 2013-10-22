require 'spec_helper'

describe "Validate Java Version" do
  subject do
    JavaVersion.valid?(version)
  end

  describe "given nil" do
    let(:version) { nil }
    it { expect(subject).to be_false }
  end

  describe "given blank" do
    let(:version) { "" }
    it { expect(subject).to be_false }
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

  describe "given JDK7u01" do
    let(:version) { "JDK7u01" }
    it { expect(subject).to be_false }
  end

  describe "given JDK07u1" do
    let(:version) { "JDK07u1" }
    it { expect(subject).to be_false }
  end

  describe "given JDK7" do
    let(:version) { "JDK7" }
    it { expect(subject).to be_false }
  end

  describe "given JDK7u" do
    let(:version) { "JDK7u" }
    it { expect(subject).to be_false }
  end

  describe "given JDKu45" do
    let(:version) { "JDKu45" }
    it { expect(subject).to be_false }
  end

  describe "given jdk7u45" do
    let(:version) { "jdk7u45" }
    it { expect(subject).to be_false }
  end
end
