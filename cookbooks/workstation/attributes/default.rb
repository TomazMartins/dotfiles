# =========================== PERSONAL =====================================
# General
default[:personal][:upgrade] = true
default[:personal][:update] = true

default[:personal][:user][:email] = 'tomaz.r.martins@gmail.com'
default[:personal][:user][:name] = 'zamott'


# ============================= DEVELOPMENT ===================================
default[:development][:android][:install] = true
default[:development][:java][:install] = true
default[:development][:cpp][:install] = true
default[:development][:rvm][:install] = true


default[:development][:java][:repository][:ppa] = 'ppa:linuxuprising/java'
default[:development][:java][:version] = 12

default[:development][:rvm][:recv_keys] = '409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
default[:development][:rvm][:keyserver] = 'hkp://pool.sks-keyservers.net'


# ============================= SYSTEM ========================================
default[:system][:home] = "/home/#{default[:personal][:user][:name]}"

# Screensaver
default[:system][:screensaver][:url] = 'https://drive.google.com/uc?authuser=0&id=14PPdI-QWIB0Z6otAI_XpfjCOFT4OqKyX&export=download'
default[:system][:screensaver][:path] = "#{Chef::Config[:file_cache_path]}/screensaver.png"
default[:system][:screensaver][:color][:secondary] = '#0000B7'

# Gedit
default[:system][:gedit][:bracket_matching] = true
default[:system][:gedit][:hightlight_lines] = true
default[:system][:gedit][:insert_spaces] = true
default[:system][:gedit][:line_numbers] = true
default[:system][:gedit][:right_margin] = true
default[:system][:gedit][:auto_indent] = true
default[:system][:gedit][:scheme] = 'tango'
default[:system][:gedit][:tabs_size] = 2


# ============================ UTILITIES ======================================
# Google Chrome
default[:utilities][:google_chrome][:key] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
default[:utilities][:google_chrome][:uri] = 'http://dl.google.com/linux/chrome/deb'
default[:utilities][:google_chrome][:arch] = 'amd64'

# --------------------------- TO INSTALL? -------------------------------------
# Internet
default[:utilities][:internet][:google_chrome][:install] = true
default[:utilities][:internet][:fast][:install] = true

# Messengers and social
default[:utilities][:messengers_social][:telegram][:install] = true
default[:utilities][:messengers_social][:skype][:install] = true
default[:utilities][:messengers_social][:slack][:install] = false

# Office
default[:utilities][:office][:libre_office][:install] = false

default[:utilities][:office][:gmail_desktop][:install] = true
default[:utilities][:office][:only_office][:install] = true
default[:utilities][:office][:csbooks][:install] = true
default[:utilities][:office][:buka][:install] = true

# Personalisation
default[:utilities][:personalisation][:disk_space_saver][:install] = true

# Education
default[:utilities][:education][:kmplot][:install] = true
default[:utilities][:education][:step][:install] = false
default[:utilities][:education][:truthtables][:install] = false
default[:utilities][:education][:atomify][:install] = false
default[:utilities][:education][:qalculate][:install] = true

# Photo and video
default[:utilities][:photo_video][:inkscape][:install] = true
default[:utilities][:photo_video][:photoscape][:install] = true
default[:utilities][:photo_video][:electron_player][:install] = true
default[:utilities][:photo_video][:youtube_dl][:install] = true
default[:utilities][:photo_video][:gimp][:install] = true

# Music and audio
default[:utilities][:music_audio][:spotify][:install] = true
default[:utilities][:music_audio][:audacity][:install] = true
default[:utilities][:music_audio][:musescore][:install] = true
default[:utilities][:music_audio][:tuxguitar][:install] = true
default[:utilities][:music_audio][:deep_voice_recorder][:install] = true


# ========================== DEVELOPEMNT ======================================
# ---------------------------- DATABASES --------------------------------------
# Postgres
default[:development][:databases][:postgres][:version] = '10.4'
default[:development][:databases][:postgres][:install] = true


# -------------------------- VIRTUALIZATION -----------------------------------
# Virtual Box
default[:development][:virtualization][:virtual_box][:version] = '6.0.8'
VITURAL_BOX_VERSION = node[:development][:virtualization][:virtual_box][:version]

default[:development][:virtualization][:virtual_box][:ubuntu][:package][:name] = "virtualbox-6.0_#{VITURAL_BOX_VERSION}-130520~Ubuntu~bionic_amd64.deb"
default[:development][:virtualization][:virtual_box][:ubuntu][:package][:url] = "https://download.virtualbox.org/virtualbox/#{VITURAL_BOX_VERSION}/virtualbox-6.0_#{VITURAL_BOX_VERSION}-130520~Ubuntu~bionic_amd64.deb"

default[:development][:virtualization][:virtual_box][:install] = true

# Vagrant
default[:development][:virtualization][:vagrant][:version] = '2.2.4'
VAGRANT_VERSION = node[:development][:virtualization][:vagrant][:version]

default[:development][:virtualization][:vagrant][:ubuntu][:package][:name] = "vagrant_#{VAGRANT_VERSION}_x86_64.deb"
default[:development][:virtualization][:vagrant][:ubuntu][:package][:url] = "https://releases.hashicorp.com/vagrant/#{VAGRANT_VERSION}/vagrant_#{VAGRANT_VERSION}_x86_64.deb"

default[:development][:virtualization][:vagrant][:install] = true

# Docker
default[:development][:virtualization][:ubuntu][:version] = 'bionic'
default[:development][:virtualization][:docker][:url] = 'https://download.docker.com/linux/ubuntu'

default[:development][:virtualization][:docker][:install] = true

# Docker Compose
default[:development][:virtualization][:docker][:compose][:version] = '1.23.1'
default[:development][:virtualization][:docker][:compose][:path] = '/usr/local/bin/docker-compose'

default[:development][:virtualization][:docker_compose][:install] = true


# ============================== FILES ========================================
# .Bashrc
default[:system][:files][:custom][:bashrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.bashrc"
default[:system][:files][:original][:bashrc][:path] = "#{default[:system][:home]}/.bashrc"

# .Zshrc
default[:system][:files][:custom][:zshrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.zshrc"
default[:system][:files][:original][:zshrc][:path] = "#{default[:system][:home]}/.zshrc"
