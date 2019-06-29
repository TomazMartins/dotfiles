# ============================================================
# BROWSERS
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