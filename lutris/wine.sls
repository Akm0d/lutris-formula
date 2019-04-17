# Solve problems with lutris wine dependency hell
# https://www.gloriouseggroll.tv/how-to-get-out-of-wine-dependency-hell

wine:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - gpgcheck: 1
    - gpgkey: https://dl.winehq.org/wine-builds/winehq.key
    {% if grains['os'] == 'Ubuntu' %}
    - name: deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main
    {% elif grains['os'] == 'Mint' %}
      {% if '17.' in grains['lsb_distrib_release'] %}
    - name: deb https://dl.winehq.org/wine-builds/ubuntu/ trusty main
      {% elif '18.' in grains['lsb_distrib_release'] %}
    - name: deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main
      {% elif '19.' in grains['lsb_distrib_release'] %}
    - name: deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main
      {% endif %}
    {% elif grains['os'] == 'Debian' %}
    - name: deb https://dl.winehq.org/wine-builds/debian/ {{ grains.item('oscodename') }} main
    {% endif %}
  {% endif %}

  pkg.installed:
    - refresh: True
    - name:
      - winetricks
    {% if grains['os'] == '(Ubuntu|Debian)' %}
      - winehq-staging
    {% elif grains['os'] == 'Arch' %}
      - wine-staging 
      - giflib 
      - lib32-giflib 
      - libpng 
      - lib32-libpng 
      - libldap 
      - lib32-libldap 
      - gnutls 
      - lib32-gnutls 
      - mpg123 
      - lib32-mpg123 
      - openal 
      - lib32-openal 
      - v4l-utils 
      - lib32-v4l-utils 
      - libpulse 
      - lib32-libpulse 
      - alsa-plugins 
      - lib32-alsa-plugins 
      - alsa-lib 
      - lib32-alsa-lib 
      - libjpeg-turbo 
      - lib32-libjpeg-turbo 
      - libxcomposite 
      - lib32-libxcomposite 
      - libxinerama 
      - lib32-libxinerama 
      - ncurses 
      - lib32-ncurses 
      - opencl-icd-loader 
      - lib32-opencl-icd-loader 
      - libxslt 
      - lib32-libxslt 
      - libva 
      - lib32-libva 
      - gtk3 
      - lib32-gtk3 
      - gst-plugins-base-libs 
      - lib32-gst-plugins-base-libs 
      - vulkan-icd-loader 
      - lib32-vulkan-icd-loader 
      - cups 
      - samba 
      - dosbox
    {% elif grains['os'] == 'Solus' %}
      - wine
      - wine-devel
      - wine-32bit-devel
    {% endif %}
