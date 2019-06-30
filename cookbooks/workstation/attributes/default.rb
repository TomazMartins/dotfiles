# =========================== PREFERENCES =====================================
# General
default[:preferences][:upgrade] = false
default[:preferences][:update] = false

default[:preferences][:user][:email] = 'tomaz.r.martins@gmail.com'
default[:preferences][:user][:name] = 'vagrant'


# ============================= SYSTEM ========================================
default[:system][:home] = "/home/#{default[:preferences][:user][:name]}"

# Screensaver
default[:system][:screensaver][:color][:secondary] = '#0000B7'
default[:system][:screensaver][:path] = "#{Chef::Config[:file_cache_path]}/screensaver.png"
default[:system][:screensaver][:url] = 'https://drive.google.com/uc?authuser=0&id=14PPdI-QWIB0Z6otAI_XpfjCOFT4OqKyX&export=download'

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
default[:utilities][:internet][:google_chrome][:install] = false
default[:utilities][:internet][:fast][:install] = true

# Messengers and social
default[:utilities][:messengers_social][:telegram][:install] = true
default[:utilities][:messengers_social][:skype][:install] = true
default[:utilities][:messengers_social][:slack][:install] = true

# Office
default[:utilities][:office][:libre_office][:install] = true

default[:utilities][:office][:gmail_desktop][:install] = true
default[:utilities][:office][:only_office][:install] = true
default[:utilities][:office][:csbooks][:install] = true
default[:utilities][:office][:buka][:install] = true

# Personalisation
default[:utilities][:personalisation][:disk_space_saver][:install] = true

# Education
default[:utilities][:education][:kmplot][:install] = true
default[:utilities][:education][:step][:install] = true
default[:utilities][:education][:truthtables][:install] = true
default[:utilities][:education][:atomify][:install] = true
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


# ============================== FILES ========================================
# .Bashrc
default[:system][:files][:custom][:bashrc][:path] = "#{default[:system][:home]}/files/.bashrc"
default[:system][:files][:original][:bashrc][:path] = "#{default[:system][:home]}/.bashrc"

# .Zshrc
default[:system][:files][:custom][:zshrc][:path] = "#{default[:system][:home]}/files/.zshrc"
default[:system][:files][:original][:zshrc][:path] = "#{default[:system][:home]}/.zshrc"