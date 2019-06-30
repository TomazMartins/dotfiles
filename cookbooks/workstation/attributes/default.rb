# =========================== PREFERENCES =====================================
# General
default[:preferences][:upgrade] = false
default[:preferences][:update] = false

default[:preferences][:user][:email] = 'tomaz.r.martins@gmail.com'
default[:preferences][:user][:name] = 'zamott'


# ============================= SYSTEM ========================================
default[:system][:home] = "/home/#{default[:system][:user]}"

# Screensaver
default[:system][:screensaver][:color][:secondary] = ''
default[:system][:screensaver][:path] = ''
default[:system][:screensaver][:url] = ''

# Gedit
default[:system][:gedit][:bracket_matching] = true
default[:system][:gedit][:hightlight_lines] = true
default[:system][:gedit][:insert_spaces] = true
default[:system][:gedit][:line_numbers] = true
default[:system][:gedit][:right_margin] = true
default[:system][:gedit][:auto_ident] = true
default[:system][:gedit][:scheme] = 'tango'
default[:system][:gedit][:tabs_size] = 2


# ============================ UTILITIES ======================================
# Google Chrome
default[:utilities][:google_chrome][:key] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
default[:utilities][:google_chrome][:uri] = 'http://dl.google.com/linux/chrome/deb'
default[:utilities][:google_chrome][:arch] = 'amd64'

# --------------------------- TO INSTALL? -------------------------------------
# Internet
default[:preferences][:internet][:google_chrome][:install] = true
default[:preferences][:internet][:fast][:install] = true

# Messengers and social
default[:preferences][:messengers_social][:telegram][:install] = true
default[:preferences][:messengers_social][:skype][:install] = true
default[:preferences][:messengers_social][:slack][:install] = true

# Office
default[:preferences][:office][:libre_office][:install] = true

default[:preferences][:office][:gmail_desktop][:install] = true
default[:preferences][:office][:only_office][:install] = true
default[:preferences][:office][:csbooks][:install] = true
default[:preferences][:office][:buka][:install] = true

# Personalisation
default[:preferences][:personalisation][:disk_space_saver][:install] = true

# Photo and video
default[:preferences][:photo_video][:inkscape][:install] = true
default[:preferences][:photo_video][:photoscape][:install] = true
default[:preferences][:photo_video][:electron_player][:install] = true
default[:preferences][:photo_video][:youtube_dl][:install] = true
default[:preferences][:photo_video][:gimp][:install] = true

# Music and audio
default[:preferences][:music_audio][:spotify][:install] = true
default[:preferences][:music_audio][:audacity][:install] = true
default[:preferences][:music_audio][:musescore][:install] = true
default[:preferences][:music_audio][:tuxguitar][:install] = true
default[:preferences][:music_audio][:deep_voice_recorder][:install] = true


# ============================== FILES ========================================
# .Bashrc
default[:system][:files][:custom][:bashrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.bashrc"
default[:system][:files][:original][:bashrc][:path] = "#{default[:system][:home]}/.bashrc"

# .Zshrc
default[:system][:files][:custom][:zshrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.zshrc"
default[:system][:files][:original][:zshrc][:path] = "#{default[:system][:home]}/.zshrc"