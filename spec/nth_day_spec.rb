require 'nth_day'

RSpec.describe Date do
  describe "#next_nth_day" do
    context "when 2nd Wednesday passed" do
      let(:next_date) { NthDay.next_occurrence("2nd Wednesday") }

      it "returns a date after today" do
        (next_date > Date.today).should be(true)
      end
      it "returns a wednesday" do
        (next_date.wednesday?).should be(true)
      end
      it "returns the 2nd wednesday of the month" do
        (next_date.nth_of_wday).should be(2)
      end
    end

    context "when 4th Thu passed" do
      let(:next_date) { NthDay.next_occurrence("4th Thu") }

      it "returns a date after today" do
        (next_date > Date.today).should be(true)
      end
      it "returns a thursday" do
        (next_date.thursday?).should be(true)
      end
      it "returns the 4th thursday of the month" do
        (next_date.nth_of_wday).should be(4)
      end
    end
  end

  describe "#nth_wday?" do
    context "when date is Thursday, Jan 1st 2015" do
      let(:date) { Date.parse('2015-01-01') }

      it "is 1st thursday" do
        (date.nth_wday?(1, 4)).should be(true)
      end

      it "is not 1st wednesday" do
        (date.nth_wday?(1, 3)).should be(false)
      end

      it "is not 2nd thursday" do
        (date.nth_wday?(2, 4)).should be(false)
      end
    end

    context "when date is Friday, Feb 20th 2015" do
      let(:date) { Date.parse('2015-02-20') }

      it "is 3rd friday" do
        (date.nth_wday?(3, 5)).should be(true)
      end

      it "is not 3rd thursday" do
        (date.nth_wday?(3, 4)).should be(false)
      end

      it "is not 4th friday" do
        (date.nth_wday?(4, 5)).should be(false)
      end
    end
  end

  describe "#nth_of_wday" do
    context "when Jan 1st passed" do
      let(:nth_of_wday) { Date.parse('2015-01-01').nth_of_wday }

      it "returns a number" do
        expect(nth_of_wday).to be_a(Fixnum)
      end

      it "returns 1" do
        expect(nth_of_wday).to be(1)
      end
    end

    context "when Feb 24th passed" do
      let(:nth_of_wday) { Date.parse('2015-02-24').nth_of_wday }

      it "returns a number" do
        expect(nth_of_wday).to be_a(Fixnum)
      end

      it "returns 4" do
        expect(nth_of_wday).to be(4)
      end
    end

    context "when March 31st passed" do
      let(:nth_of_wday) { Date.parse('2015-03-31').nth_of_wday }

      it "returns a number" do
        expect(nth_of_wday).to be_a(Fixnum)
      end

      it "returns 5" do
        expect(nth_of_wday).to be(5)
      end
    end
  end

  describe "#wday_named" do
    it "parses full weekday names" do
      expect(NthDay.wday_named("Monday")).to be(1)
      expect(NthDay.wday_named("Tuesday")).to be(2)
      expect(NthDay.wday_named("Wednesday")).to be(3)
    end

    it "parses shortened names" do
      expect(NthDay.wday_named("Thurs")).to be(4)
      expect(NthDay.wday_named("Fri")).to be(5)
    end

    it "doesn't care about case" do
      expect(NthDay.wday_named("MON")).to be(1)
    end

    it "even works with 2 character names" do
      expect(NthDay.wday_named("Su")).to be(0)
      expect(NthDay.wday_named("Sa")).to be(6)
    end

    it "does require at least 2 chars" do
      expect(NthDay.wday_named("S")).to be_nil
    end
  end
end
