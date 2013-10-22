require 'spec_helper'

describe "Next Java Version" do
  describe "when current is JDK7u45" do
    let(:current) { JavaVersion.parse("JDK7u45") }

    it do
      expect(current.next_limited_update.update_number).to eq(60)
    end

    it do
      expect(current.next_critical_patch_update.update_number).to eq(51)
    end

    it do
      expect(current.next_security_alert.update_number).to eq(46)
    end
  end

  describe "when current is JDK7u44" do
    let(:current) { JavaVersion.parse("JDK7u44") }

    it do
      expect(current.next_limited_update.update_number).to eq(60)
    end

    it do
      expect(current.next_critical_patch_update.update_number).to eq(45)
    end

    it do
      expect(current.next_security_alert.update_number).to eq(46)
    end
  end

  describe "when current is JDK7u59" do
    let(:current) { JavaVersion.parse("JDK7u59") }

    it do
      expect(current.next_critical_patch_update.update_number).to eq(61)
    end

    it do
      expect(current.next_security_alert.update_number).to eq(62)
    end
  end

  describe "when current is JDK7u69" do
    let(:current) { JavaVersion.parse("JDK7u69") }

    it do
      expect(current.next_critical_patch_update.update_number).to eq(71)
    end

    it do
      expect(current.next_security_alert.update_number).to eq(72)
    end
  end
end
