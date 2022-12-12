require_relative '../lib/diary_entry'

RSpec.describe DiaryEntry do
    it 'constructs ' do
        diary_entry = DiaryEntry.new("my title", "my contents")
        expect(diary_entry.title).to eq "my title"
        expect(diary_entry.contents).to eq "my contents"
    end
    describe "#count_words" do
        it "count words" do 
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect(diary_entry.count_words).to eq 2
        end
        it 'returns zero when no contents given ' do 
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.count_words).to eq 0
        end
    end
    describe "#reading_time" do
        it "count words" do 
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect(diary_entry.reading_time(2)).to eq 1
        end
        it 'returns zero when no contents given ' do 
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.reading_time(2)).to eq 0
        end
        it 'gives an error when wpm is zero' do 
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect { diary_entry.reading_time(0) }.to raise_error "WPM must be a positive number"
        end
    end
end