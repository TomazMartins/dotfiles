# ============================================================
# INTERNET
# ============================================================

# O Google Chrome é o navegador mais utilizado no Brasil e no
# mundo atualmente, porém, só está disponível para distribuições
# Linux de 64 bits.
apt_repository 'Add: Google Chrome' do
  arch node[:utilities][:google_chrome][:arch]
  uri node[:utilities][:google_chrome][:uri]
  key node[:utilities][:google_chrome][:key]
  distribution 'stable'
  components %w(main)
  action :add
end

package 'Install: Google Chrome' do
  package_name 'google-chrome-stable'
  options '--force-yes'
  action :install
end

# Test your internet download speed from terminal
execute 'Install: fast' do
  command 'sudo snap install fast'
end

# ============================================================
# MESSENGERS AND SOCIAL
# ============================================================
# Caution: Slack for Linux is in beta. We’re still busy adding
# features and ironing out potential issues.
# 
# Slack brings team communication and collaboration into one
# place so you can get more work done, whether you belong to a
# large enterprise or a small business. Check off your to-do
# list and move your projects forward by bringing the right
# people, conversations, tools, and information you need
# together. Slack is available on any device, so you can find
# and access your team and your work, whether you’re at your
# desk or on the go.
execute 'Install: Slack' do
  command 'sudo snap install slack --classic'
end

# Skype keeps the world talking. Say “hello” with an instant
# message, voice or video call – all for free. Skype is available
# on phones, tablets, PCs, Macs and Linux.
execute 'Install: Skype' do
  command 'sudo snap install skype --classic'
end

# Pure instant messaging — simple, fast, secure, and synced across
# all your devices. Over 100 million active users in two and a
# half years.
execute 'Install: Telegram' do
  command 'sudo snap install telegram-desktop'
end


# ============================================================
# OFFICE
# ============================================================

# ONLYOFFICE Desktop Editors is a free open source office suite
# that combines text, spreadsheet and presentation editors
# allowing to create, view and edit documents stored on your
# Windows/Linux PC or Mac without an Internet connection. It is
# fully compatible with Office Open XML formats: .docx, .xlsx,
# .pptx
execute 'Removes: libreoffice' do
  command <<-EOH
    sudo apt-get remove --purge libreoffice*
    sudo apt-get clean
    sudo apt-get autoremove
  EOH
end

execute 'Install: only-office' do
  command 'sudo snap install onlyoffice-desktopeditors'
end

# Gmail Desktop is a cross-platform dedicated Gmail app written in
# Electron. This app supports notifications, multiple accounts,
# default mailto handling, and more!
execute 'Install: Gmail Desktop' do
  command 'sudo snap install gmail-desktop'
end

# EBook Management
execute 'Install: Buka' do
  command 'sudo snap install buka'
end

# csBooks is a smart solution to manage all your PDF, EPUB and
# MOBI files. csBooks will automatically generate thumbnails
# for your books so that you can easily browse them and read
# them without problems. csBooks is focused on clean and
# beautiful interface with excellent user experience. csBooks
# supports PDF, EPUB and MOBI format of books and maintains the
# read status for them.
execute 'Install: csBooks' do
  command 'sudo snap install csbooks'
end


# ============================================================
# PERSONALISATION
# ============================================================
# Disk Space Saver is a disk space analyzer, that will help you
# to find large space hogs on hard drive in seconds! And free
# up disk space easily in a click!
#
# This tiny, flexible, hard-working tool supports all desktop
# platforms: Windows, macOS and Linux.
#
# The software visualize all data on hard drive so you can spot
# & delete large files and folders in a simple click.
execute 'Install: Disk Space Saver' do
  command 'sudo snap install disk-space-saver'
end


# ============================================================
# EDUCATION
# ============================================================
execute 'Install: kmplot' do
  command 'sudo snap install kmplot'
end

# Step is an interactive physical simulator. It allows you to
# explore the physical world through simulations. It works like
# this: you place some bodies on the scene, add some forces such
# as gravity or springs, then click Simulate and Step shows you
# how your scene will evolve according to the laws of physics.
# You can change every property of the bodies/forces in your
# experiment (even during simulation) and see how this will
# change evolution of the experiment. With Step you cannot only
# learn but feel how physics works!
execute 'Install: step' do
  command 'sudo snap install step'
end

# Generates truth tables. Allows 30 different variables.
execute 'Install: truthtables' do
  command 'sudo snap install truthtables'
end

# Atomify LAMMPS is an easy-to-use visualizer and editor for the
# molecular dynamics simulator LAMMPS. Atomify supports OpenMP
# acceleration, live plotting of LAMMPS variables and computes,
# and an easy to use code editor in one single program. The
# latter utilizes the powerful machinery already built into LAMMPS
# to allow easy access to advanced physical quantities. Atomify
# is open source software written in C++ built on top of Qt.
execute 'Install: atomify' do
  command 'sudo snap install atomify'
end

# Qalculate! is a multi-purpose cross-platform desktop calculator.
# It is simple to use but provides power and versatility normally
# reserved for complicated math packages, as well as useful tools
# for everyday needs (such as currency conversion and percent
# calculation). Features include a large library of customizable
# functions, unit calculations and conversion, physical constants,
# symbolic calculations (including integrals and equations),
# arbitrary precision, uncertainty propagation, interval arithmetic,
# plotting, and a user-friendly interface.
execute 'Install: QCalculate' do
  command 'sudo snap install qalculate'
end


# ============================================================
# PHOTO AND VIDEO
# ============================================================

# An Open Source vector graphics editor, with capabilities similar
# to Illustrator, CorelDraw, or Xara X, using the W3C standard
# Scalable Vector Graphics (SVG) file format.
execute 'Install: inkscape' do
  command 'sudo snap install inkscape'
end

# PhotoScape is a fun and easy photo editing software that enables
# you to fix and enhance photos.
execute 'Install: photoscape' do
  command 'sudo snap install photoscape'
end

# An Electron Based Web Video Services Player. Supporting Netflix,
# Youtube, Twitch, Floatplane And More.
execute 'Install: electron-player' do
  command 'sudo snap install electronplayer'
end

# Is a command-line program to download videos from YouTube.com and
# a few more sites. It requires the Python interpreter, version
# 2.6, 2.7, or 3.2+, and it is not platform specific. It should work
# on your Unix box, on Windows or on macOS. It is released to the
# public domain, which means you can modify it, redistribute it or
# use it however you like.
execute 'Install: youtube-dl' do
  command 'sudo snap install youtube-dl'
end

# Whether you are a graphic designer, photographer, illustrator, or
# scientist, GIMP provides you with sophisticated tools to get your
# job done. You can further enhance your productivity with GIMP
# thanks to many customization options and 3rd party plugins.
execute 'Install: gimp' do
  command 'sudo snap install gimp'
end

# ============================================================
# MUSIC AND AUDIO
# ============================================================

# Stream the tracks you love instantly, browse the charts or
# fire up readymade playlists in every genre and mood. Radio
# plays you great song after great song, based on your music
# taste. Discover new music too, with awesome playlists built
# just for you.
execute 'Install: spotify' do
  command 'sudo snap install spotify'
end

# Audacity is a free, easy-to-use, multi-track audio editor and
# recorder for Windows, Mac OS X, GNU/Linux and other operating
# systems. The interface is translated into many languages.
execute 'Install: audacity' do
  command 'sudo snap install audacity'
end

# MuseScore is the world's leading free and open-source software
# for writing music, with a user-friendly interface and immensely
# powerful features. It is free to install on Windows, Mac, and
# Linux.
execute 'Install: musescore' do
  command 'sudo snap install musescore'
end

# TuxGuitar is a free, open source tablature editor, which includes
# features such as tablature editing, score editing, and import and
# export of Guitar Pro gp3, gp4, and gp5 files
execute 'Install: tuxguitar' do
  command 'sudo snap install tuxguitar-vs'
end

# This is deepin-voice-recorder snap application. It can be used to
# record and play voice files.
execute 'Install: deep-voice-recorder' do
  command 'sudo snap install deepin-voice-recorder'
end