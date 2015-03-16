module Accredible
  class Evidence < ApiResource

    def self.add_url_evidence(params)
      credentials = check_credential(params[:email], params[:achievement_id])
      credentials.each do |credential|
        credential_id = credential["id"]
        url = URL + "/v1/credentials/"+credential_id.to_s+"/evidence_items"
        payload = { :evidence_item => { :description => params[:description] , :url => params[:url]}}
        Accredible.request('post', url ,payload)
      end
    end

    def self.add_local_file(params)
      credentials = check_credential(params[:email], params[:achievement_id])
      credentials.each do |credential|
        credential_id = credential["id"]
        url = URL + "/v1/credentials/"+credential_id.to_s+"/evidence_items/local"
        payload = {:description => params[:description], :file => params[:file]}
        Accredible.request('post_local_file', url, payload)
      end
    end
  end

end