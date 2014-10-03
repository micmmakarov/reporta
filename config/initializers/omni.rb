Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GKEY'], ENV['GSECRET'], scope: "user,repo,gist"
end