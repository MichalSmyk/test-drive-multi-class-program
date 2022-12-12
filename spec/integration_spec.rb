require_relative '../lib/diary_entry'
require_relative '../lib/diary'

RSpec.describe 'integrates' do 
    context 'afer adding some entries' do 
        it 'lists all entries added' do 
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.all).to eq [diary_entry_1, diary_entry_2]
        end
        describe "#count_words" do
            it "counts the words in all diary entries" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
                diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2 la la")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                expect(diary.count_words).to eq 8
            end
        end
        describe 'reading time ' do 
            it 'calculates reading time for all entries where it fits exactly ' do 
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
                diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2 la la")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                expect(diary.reading_time(2)).to eq 4
            end
            it 'calculates reading time for all entries where it does not fit exactly ' do 
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
                diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2 la")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                expect(diary.reading_time(2)).to eq 4
            end
        end
        describe "best reading time entry behaviour" do 
            it "fails where wpm is 0" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("mu title", "my contents")
                diary.add(diary_entry_1)
                expect { diary.find_best_entry_for_reading_time(0,1) }.to raise_error("WPM must be a positive number")
            end
            context "where we just have one entry" do 
                it "returns taht entry " do 
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("my title 1", "my contents")
                    diary.add(diary_entry_1)
                    result = diary.find_best_entry_for_reading_time(2,1)
                    expect(result).to eq diary_entry_1
                end
            end
            context "where we have one entry and it is unreadable in the time" do 
                it "returns nill" do 
                    diary = Diary.new
                    diary_entry_1 = DiaryEntry.new("my title 1", "my contents but longer")
                    diary.add(diary_entry_1)
                    result = diary.find_best_entry_for_reading_time(2,1)
                    expect(result).to eq nil
                end
            end
            context"where we have multiple entries" do 
                it "returns the longest entry the user could read in this time " do
                    diary = Diary.new
                    best_entry = DiaryEntry.new("my title", "one two")
                    diary.add(best_entry)
                    diary.add(DiaryEntry.new("my title", "one two three"))
                    diary.add(DiaryEntry.new("my title", "one two three four"))
                    result = diary.find_best_entry_for_reading_time(2,1)
                    expect(result).to eq best_entry
                end
            end
        end
    end
end
