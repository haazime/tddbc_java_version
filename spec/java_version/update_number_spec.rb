require 'spec_helper'

class JavaVersion
  describe UpdateNumber do
    describe ".create" do
      subject do
        described_class.create(number)
      end

      describe "given 40" do
        let(:number) { 40 }
        it { expect(subject).to be_instance_of(UpdateNumber::LimitedUpdate) }
      end

      describe "given 45" do
        let(:number) { 45 }
        it { expect(subject).to be_instance_of(UpdateNumber::CriticalPatchUpdate) }
      end

      describe "given 51" do
        let(:number) { 51 }
        it { expect(subject).to be_instance_of(UpdateNumber::SecurityAlert) }
      end

      describe "given 61" do
        let(:number) { 61 }
        it { expect(subject).to be_instance_of(UpdateNumber::CriticalPatchUpdate) }
      end
    end
  end
end
