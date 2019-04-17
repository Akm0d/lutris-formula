{%- from 'lutris/map.jinja' import lutris with context %}

lutris:
  pkgrepo.managed:
    - gpgcheck: {{ lutris.gpgcheck }}
    - gpgkey: {{ lutris.gpgkey }}
    - name: {{ lutris.repo }}
    - ppa: {{ lutris.ppa }}

  pkg.installed:
    - refresh: True
