# ============================================================
# UPDATE AND UPGRADE UBUNTU
# ============================================================

# ======================= Variables ==========================
user_name = node[:preferences][:user]
user_home = node[:system][:home]

is_update = node[:preferences][:update]
is_upgrade = node[:preferences][:upgrade]


# ========================= Commads ========================== 
execute 'Update: System' do
  command 'sudo apt update -y'
  action :run
  only_if is_update
end

execute 'Upgrade: System' do
  command 'sudo apt upgrade -y'
  action :run
  only_if is_upgrade
end

# This package enables the usage of 'deb https://foo distro
# main' lines in the /etc/apt/sources.list so that all package
# managers using the libapt-pkg library can access metadata and
# packages available in sources accessible over https (Hypertext
#Transfer Protocol Secure).
package 'Install: apt-transport-https' do
  package_name 'apt-transport-https'
  options '--force-yes'
  action :install
end

# Por conta de questões legais, o Ubuntu não inclui alguns
# codecs de mídia para reproduzir arquivos de áudio e vídeo
# através do reprodutor de mídia Totem padrão e do reprodutor
# de música Rhythmbox.
#
# WARNING: Pesquisar como aceitar os termos de uso automaticamente....
package 'Install: Third Codes' do
  package_name 'ubuntu-restricted-extras'
  options '--force-yes'
  action :install
end


# ============================================================
# CUSTOMIZE UBUNTU
# ============================================================

# É um aglomerador de configurações para o Gnome. Serve para
# habilitar uma interface que permite acesso a configurações
# do sistema de forma simples.
#
# Deve-se lembrar que é uma aplicação poderosa e que é
# aconselhável apenas para uso de pessoas experientes.
package 'Install: dconf-tools' do
  package_name 'dconf-tools'
  options '--force-yes'
  action :install
end

# Configura a posição dos botões da janela (DIREITA -> ESQUERDA)
execute 'Configure: buttons window\'s position' do
  command "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'"
  action :run
end

# Habilita a opção de luz noturna no sistema
execute 'Configure: night light' do
  command 'gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true'
  action :run
end

# Habilita a opção de configuração automática do timezone
execute 'Configure: automatic timezone' do
  command 'gsettings set org.gnome.desktop.datetime automatic-timezone true'
  action :run
end

# Habilita a opção para mostrar a data junto ao relógio
execute 'Configure: show date in clock' do
  command 'gsettings set org.gnome.desktop.interface clock-show-date true'
  action :run
end

# Habilita a opção para mostrar o dia da semana junto ao relógio
execute 'Configure: show weekday in clock' do
  command 'gsettings set org.gnome.desktop.interface clock-show-weekday true'
  action :run
end

# Habilita a opção para mostrar a porcentagem da bateria
execute 'Configure: show percentage of battery' do
  command 'gsettings set org.gnome.desktop.interface show-battery-percentage true'
  action :run
end

# Alterar o método de clique no touchpad
# Opções: ['none', 'default', 'fingers', 'areas']
execute 'Configure: change method of click in touchpad' do
  command "gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'"
  action :run
end

# Habilita a opção desabilitar o touchpad enquanto digita
execute 'Configure: disable touchpad while typing' do
  command "gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true"
  action :run
end

# Altera o método de rolagem do touchpad
# Opções: ['disabled', 'edge-scrollping', 'thow-fingers-scrolling']
execute 'Configure: disable touchpad while typing' do
  command "gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-fingers-scrolling'"
  action :run
end

image_screensaver_path = node[:system][:screensaver][:path]
image_screensaver_url = node[:system][:screensaver][:url]

# Faz o download da imagem do screensaver
remote_file "#{Chef::Config[:file_cache_path]}/screensaver.png" do
  source image_screensaver_url
end

# Altera a imagem do screensaver
execute 'Configure: change screensaver' do
  command "gsettings set org.gnome.desktop.screensaver.picture-uri '#{image_screensaver_path}'"
  action :run
end

screensaver_secondary_color = node[:system][:screensaver][:color][:secondary]

# Altera a cor secundária do screensaver
execute 'Configure: change secondary color in screensaver' do
  command "gsettings set org.gnome.desktop.screensaver.secondary-color '#{screensaver_secondary_color}'"
  action :run
end

# Habilitar a busca de provedores externos
execute 'Configure: search with external providers' do
  command "gsettings set org.gnome.desktop.search-providers.disable-external false"
  action :run
end

is_gedit_bracket_matching = node[:system][:gedit][:bracket_matching]
is_gedit_highlight_line = node[:system][:gedit][:hightlight_lines]
is_gedit_insert_spaces = node[:system][:gedit][:insert_spaces]
is_gedit_line_numbers = node[:system][:gedit][:line_numbers]
is_gedit_right_margin = node[:system][:gedit][:right_margin]
is_gedit_auto_ident = node[:system][:gedit][:auto_ident]

gedit_tabs_size = node[:system][:gedit][:tabs_size]
gedit_scheme = node[:system][:gedit][:scheme]

execute 'Configure: auto-ident of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor auto-ident #{is_gedit_auto_ident}"
  action :run
end

execute 'Configure: bracket-matching of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor bracket-matching #{is_gedit_bracket_matching}"
  action :run
end

execute 'Configure: display-line-numbers of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor display-line-numbers #{is_gedit_line_numbers}"
  action :run
end

execute 'Configure: display-right-margin of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor display-right-margin #{is_gedit_right_margin}"
  action :run
end

execute 'Configure: highlight-current-line of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor highlight-current-line #{is_gedit_highlight_line}"
  action :run
end

execute 'Configure: insert-spaces of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor insert-spaces #{is_gedit_insert_spaces}"
  action :run
end

execute 'Configure: scheme of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor scheme #{gedit_scheme}"
  action :run
end

execute 'Configure: tabs-size of gedit' do
  command "gsettings set org.gnome.gedit.preferences.editor tabs-size #{gedit_tabs_size}"
  action :run
end

# Com o GNOME Tweak Tool você pode configurar o tema do
# ambiente gráfico, e por consequência da distro em si. Você
# pode alterar as configurações do Desktop, como ícones
# presentes ou não, manusear extensões do Shell, configurar
# fontes, atalhos do teclado, gerenciamento de energia,
# aplicações que iniciam com o sistema, formatos de data e
# 3 hora, ícones da janelas, animações e até as múltiplas
# áreas de trabalho virtuais.
package 'Install: gnome-tweaks' do
  package_name 'gnome-tweaks'
  options '--force-yes'
  action :install
end

original_bashrc_path = node[:system][:files][:original][:bashrc][:path]
custom_bashrc_path = node[:system][:files][:custom][:bashrc][:path]

# Customize .bashrc based on my custom .bashrc
file original_bashrc_path do
  content IO.read(custom_bashrc_path)
  action :create
end

original_zshrc_path = node[:system][:files][:original][:zshrc][:path]
custom_zshrc_path = node[:system][:files][:custom][:zshrc][:path]

# Customize .zshrc based on my custom .zshrc
file original_zshrc_path do
  content IO.read(custom_zshrc_path)
  action :create
end

# ============================================================
# GNOME EXTENSIONS UBUNTU
# ============================================================

# Install Gnome shell host connector to Google Chrome
package 'Install: chrome-gnome-shell' do
  package_name 'chrome-gnome-shell'
  options '--force-yes'
  action :install
end

# Install Gnome shell extenstions of Ubuntu, as a package
package 'Install: gnome-shell-extensions' do
  package_name 'gnome-shell-extensions'
  options '--force-yes'
  action :install
end