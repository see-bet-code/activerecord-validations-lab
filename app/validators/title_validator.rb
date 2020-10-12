class TitleValidator < ActiveModel::Validator
    CLICKBAIT_KEYWORDS = [
            /Won't Believe/,
            /Secret/,
            /Guess/,
            /Top [0-9]/
        ]
    def validate(record)
        res = CLICKBAIT_KEYWORDS.none? { |w| w.match? record.title if record.title }
        record.errors[:title] << "is not sufficiently clickbait-y." if res
    end
end