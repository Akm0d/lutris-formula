lutris:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    {% if grains['os'] == 'Debian' %}
    - gpgcheck: 1
    - gpgkey: https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key
    - name: deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./
    {% else %}
    - ppa: lutris-team/lutris
    {% endif %}
  {% endif %}

  pkg.installed:
    - refresh: True
    - name: lutris
