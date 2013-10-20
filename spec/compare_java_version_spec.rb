require 'spec_helper'

describe "Compare Java Version" do
  let(:jdk7u40) { JavaVersion.parse("JDK7u40") }
  let(:jdk7u51) { JavaVersion.parse("JDK7u51") }
  let(:jdk8u0) { JavaVersion.parse("JDK8u0") }

  it { expect(jdk7u40 < jdk7u51).to be_true }
  it { expect(jdk7u40 > jdk7u51).to be_false }
  it { expect(jdk7u40 < jdk8u0).to be_true }
  it { expect(jdk8u0 > jdk7u51).to be_true }

  it { expect(jdk7u40 == jdk7u40).to be_true }
end
