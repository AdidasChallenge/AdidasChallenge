# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'

def user_interface_pods
  # Layout
  pod 'EasyPeasy'
  
  # Image downloading and caching
  pod 'Nuke'
  
  # Animations
  pod 'lottie-ios'
end

def firebase_pods
    pod 'Firebase/Crashlytics'
end


def injection_pods
    pod 'Swinject'
    pod 'SwinjectAutoregistration'
end

def networking_pods
    pod 'Alamofire'
end


target 'AdidasChallenge' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AdidasChallenge
  injection_pods
  user_interface_pods
  firebase_pods
  networking_pods
  
  target 'AdidasChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AdidasChallengeUITests' do
    # Pods for testing
  end

end
