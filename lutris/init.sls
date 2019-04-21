{%- from 'lutris/map.jinja' import lutris with context %}

lutris:
  {% if grains.os_family == 'Debian' %}
  pkgrepo.managed:
    - gpgcheck: {{ lutris.gpgcheck }}
    - gpgkey: {{ lutris.gpgkey }}
    - name: {{ lutris.repo }}
    - ppa: {{ lutris.ppa }}
  {% endif %}

  pkg.installed:
    - refresh: True
