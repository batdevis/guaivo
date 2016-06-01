class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
=begin
access_token:
    ---------------------------------------
--- !ruby/hash:OmniAuth::AuthHash
provider: google_oauth2
uid: '102352117852378243249'
info: !ruby/hash:OmniAuth::AuthHash::InfoHash
  name: Devis Battisti
  email: devis.battisti@rawfish.it
  first_name: Devis
  last_name: Battisti
  image: https://lh6.googleusercontent.com/-ePfO8EAOUkE/AAAAAAAAAAI/AAAAAAAAABU/BYULtd5m10s/photo.jpg
credentials: !ruby/hash:OmniAuth::AuthHash
  token: ya29.CjHzAnFiT7tDGDuXH-iMpKn9kNhuYXpidbDcwFEW6vI1toKA0mdcXsns3-CLUf4_4lE0
  refresh_token: 1/guXilsBAKf16hFFFcHxld7r5pMh7OFKSQuNNTH62AFI
  expires_at: 1464785168
  expires: true
extra: !ruby/hash:OmniAuth::AuthHash
  id_token: eyJhbGciOiJSUzI1NiIsImtpZCI6IjI5YzVlMmIzYThjMTQyOWQ3MzA0M2EyNzJkMGVkMWRjYTQ1NjJjYTYifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXRfaGFzaCI6Im05WUNIdUZZNG9CYnNIRDRCZUdHaEEiLCJhdWQiOiIxMzk0NTMwMzE5MDgtYzJkY2lsMWJybTU1cHJ2ZW12b2VwdWNzaWNsOHM2OTEuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDIzNTIxMTc4NTIzNzgyNDMyNDkiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiMTM5NDUzMDMxOTA4LWMyZGNpbDFicm01NXBydmVtdm9lcHVjc2ljbDhzNjkxLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiaGQiOiJyYXdmaXNoLml0IiwiZW1haWwiOiJkZXZpcy5iYXR0aXN0aUByYXdmaXNoLml0IiwiaWF0IjoxNDY0NzgxNTY4LCJleHAiOjE0NjQ3ODUxNjh9.nweRqAYDnm52bmpeG2LTmHYPdJ_7oziUFI7MFZBT-KNlhihM7CPo2ymGpCjEvdyGzCvK4F2Rm0qCVHhE9cvawxh26c6DJUcterNVw_eUSljHWcU_cniyWXlucxqpRoz34gp5kNVlYWMuTMCP2sPWiC5RBqeu1fTiw7wYBFsAgXKQnFg-3poiYax1B6tiNv8feXpO0S5Khw0q-bXBhxwo0EdkLBirzHwbZqkZ975aZY2EBsGQkNI9jtCdPchRBOvqBWfiGNkJzT1Ke2wPUQZsF_x2ul09sQutCz55oISJDW3VT7s4bL3RkcXIFlyXCWUFYFQAVDdTOckz0PKptJ5AMQ
  id_info: !ruby/hash:OmniAuth::AuthHash
    iss: accounts.google.com
    at_hash: m9YCHuFY4oBbsHD4BeGGhA
    aud: 139453031908-c2dcil1brm55prvemvoepucsicl8s691.apps.googleusercontent.com
    sub: '102352117852378243249'
    email_verified: true
    azp: 139453031908-c2dcil1brm55prvemvoepucsicl8s691.apps.googleusercontent.com
    hd: rawfish.it
    email: devis.battisti@rawfish.it
    iat: 1464781568
    exp: 1464785168
  raw_info: !ruby/hash:OmniAuth::AuthHash
    kind: plus#personOpenIdConnect
    sub: '102352117852378243249'
    name: Devis Battisti
    given_name: Devis
    family_name: Battisti
    picture: https://lh6.googleusercontent.com/-ePfO8EAOUkE/AAAAAAAAAAI/AAAAAAAAABU/BYULtd5m10s/photo.jpg?sz=50
    email: devis.battisti@rawfish.it
    email_verified: 'true'
    locale: it
    hd: rawfish.it
---------------------------------------
=end
    data = access_token.info
    user = User.where(:email => data["email"]).first

    if user.present?
      user.firstname = data["first_name"] if user.firstname != data["first_name"]
      user.lastname = data["last_name"] if user.lastname != data["last_name"]
      user.avatar = data["image"] if user.avatar != data["image"]
      user.save
    else
      if access_token.extra.hd == ENV.fetch('GOOGLE_ORGANIZATION')
        user = User.create(
          firstname: data["first_name"],
          lastname: data["last_name"],
          avatar: data["image"],
          #password: Devise.friendly_token[0,20],
          email: data["email"]
        )
      end
    end
    user
  end
end
