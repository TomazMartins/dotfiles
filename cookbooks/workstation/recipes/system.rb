# ============================================================
# FIRST STEPS AFTER INSTALL UBUNTU
# ============================================================
execute 'Update: System' do
  command 'sudo apt update'
  action :run
end

execute 'Upgrade: System' do
  command 'sudo apt upgrade'
  action :run
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

# O Google Chrome é o navegador mais utilizado no Brasil e no
# mundo atualmente, porém, só está disponível para distribuições
# Linux de 64 bits.
apt_repository 'Add: Google Chrome' do
  arch node[:system][:google_chrome][:arch]
  uri node[:system][:google_chrome][:uri]
  key node[:system][:google_chrome][:key]
  distribution 'stable'
  components %w(main)
  action :add
end

package 'Install: Google Chrome' do
  package_name 'google-chrome-stable'
  action :install
end