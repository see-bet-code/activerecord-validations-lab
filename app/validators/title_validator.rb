class TitleValidator < ActiveModel::Validator
    def validate(record)
        res = ["Won't Believe", "Secret", "Guess"].none? do |w|
            record.title.include? w if record.title
        end
        record.errors[:title] << "is not sufficiently clickbait-." if res
    end
end