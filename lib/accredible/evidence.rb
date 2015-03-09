module Accredible
  class Evidence < ApiResource

    def self.add_url_evidence(params)
      credential_id = check_credential(params[email], params[achievement_id])
      url = "https://staging.accredible.com/v1/credentials/"+credential_id.to_s+"/evidence_items"
      payload = { :evidence_item => { :description => params[:description] , :url => params[:url]}}
      Accredible.request(post, payload)
    end
  end

end