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