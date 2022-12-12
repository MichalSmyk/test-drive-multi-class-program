class Diary
    def initialize
        @entries = []
    end
  
    def add(entry) 
        @entries << entry
    end
  
    def all
        return @entries
    end
  
    def count_words
      return @entries.sum(&:count_words)
    end
  
    def reading_time(wpm) 
        return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        return @entries.first
    end
  end