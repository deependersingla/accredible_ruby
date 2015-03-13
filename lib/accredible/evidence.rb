module Accredible
  class Evidence < ApiResource

    def self.add_url_evidence(params)
      credential_id = check_credential(params[:email], params[:achievement_id])
      url = "https://api.accredible.com/v1/credentials/"+credential_id.to_s+"/evidence_items"
      payload = { :evidence_item => { :description => params[:description] , :url => params[:url]}}
      Accredible.request('post', url ,payload)
    end

    def self.add_local_file(params)
      credential_id = check_credential(params[:email], params[:achievement_id])
      url = "https://api.accredible.com/v1/credentials/"+credential_id.to_s+"/evidence_items/local"
      payload = {:description => params[:description], :file => params[:file]}
      Accredible.request('post_local_file', url, payload)
    end
  end

end