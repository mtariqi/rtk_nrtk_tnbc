# RTK-NRTK Project Aliases
set PROJECT_ROOT $HOME/rtk_nrtk_tnbc

abbr --add rtkup 'cd $PROJECT_ROOT/docker && docker compose up -d'
abbr --add rtkdown 'cd $PROJECT_ROOT/docker && docker compose down'
abbr --add rtkps 'docker ps'
abbr --add rtkjup 'docker exec -it rtk_nrtk_tnbc-jupyter-1 jupyter notebook list'
abbr --add rtkcd 'cd $PROJECT_ROOT'
abbr --add rtkenv 'conda activate rtk_env 2>/dev/null || echo "Run: conda env create -f $PROJECT_ROOT/envs/environment.yml"'
