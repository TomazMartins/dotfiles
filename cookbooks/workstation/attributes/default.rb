# =========================== PREFERENCES =====================================
default[:preferences][:update] = false
default[:preferences][:update] = false
default[:preferences][:user] = 'zamott'


# ============================= SYSTEM ========================================
default[:system][:home] = "/home/#{default[:system][:user]}"


# ============================ UTILITIES ======================================
# Google Chrome
default[:utilities][:google_chrome][:key] = 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
default[:utilities][:google_chrome][:uri] = 'http://dl.google.com/linux/chrome/deb'
default[:utilities][:google_chrome][:arch] = 'amd64'


# ============================== FILES ========================================
# .Bashrc
default[:system][:files][:custom][:bashrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.bashrc"
default[:system][:files][:original][:bashrc][:path] = "#{default[:system][:home]}/.bashrc"

# .Zshrc
default[:system][:files][:custom][:zshrc][:path] = "#{default[:system][:home]}/git/dotfiles/files/.zshrc"
default[:system][:files][:original][:zshrc][:path] = "#{default[:system][:home]}/.zshrc"