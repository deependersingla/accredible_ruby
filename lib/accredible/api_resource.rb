module Accredible
  class ApiResource

  	def self.check_credential(user_email,achievement_id)
  	  url = "https://staging.accredible.com/v1/credentials?achievement_id="+ achievement_id.to_s + "&email=" + user_email.to_s
      response = Accredible.request('get', url)
      credentials  = JSON.parse(response.body)["credentials"]
      if credentials.count == 1 
         return credentials.first["id"]
      elsif credentials.count == 0
      	raise AccredibleError.new('user: ' + user_email  + 'don\'t have any certificate'\
        'See https://accredible.com for details, or email support@accredible.com ' \
        'if you have any questions.')
      elsif credentials.count > 1
       	raise AccredibleError.new('user: ' + user_email  + 'have more than one certificate for this course, please delete extras'\
        'See https://accredible.com for details, or email support@accredible.com ' \
        'if you have any questions.')
      end
  	end
  end
end