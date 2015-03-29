Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 'c055b4c942934b0f9c1755f17ae89df5', '9a89c35e8c1b40e6928bf2d1a92e0de5'
end