module Accredible
  class Evidence < ApiResource

    def self.add_url_evidence(user_email,achievement_id,url)
       check_credential(user_email, achievement_id)
    end
  end
end