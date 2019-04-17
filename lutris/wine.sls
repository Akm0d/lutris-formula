# Solve problems with lutris wine dependency hell
# https://www.gloriouseggroll.tv/how-to-get-out-of-wine-dependency-hell
{%- from 'lutris/map.jinja' import wine with context %}

wine:
  pkgrepo.managed:
    - gpgcheck: {{ wine.gpgcheck }}
    - gpgkey: {{ wine.gpgkey }}
    - name: {{ wine.repo }}

  pkg.installed:
    - refresh: True
    - names: {{ wine.dependencies }}
