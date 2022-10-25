module Player::Methods

    def age
        return nil if birthdate.blank?
        today = Date.today
        today.year - birthdate.year - ((today.month > birthdate.month || (today.month >= birthdate.month && today.day >= birthdate.day)) ? 0 : 1 )
    end

end