yum_repo_file:
  file.managed:
    - name: /etc/yum.repos.d/alocal.repo
    - source: salt://source/6/alocal.repo
