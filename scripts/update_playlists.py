import yaml
import os

with open(r'../ChunksUnited/Resources/playlists.yml') as file:
    playlists = yaml.full_load(file)

    for playlist in playlists:
      for clip in playlist["clips"]:
        cmd = 'bash load_clip.sh "{url}" "{start}" "{end}" "../ChunksUnited/Resources/Videos/{name}"'.format(url=clip["url"],start=clip["start"],end=clip["end"],name=clip["name"])
        os.system(cmd)