import yaml
import os
from furl import furl
import glob

for f in glob.glob('../8chunks/Resources/Videos/*'):
    os.remove(f)

for f in glob.glob('../8chunks/Resources/Thumbnails/*'):
    os.remove(f)

with open(r'../8chunks/Resources/playlists.yml') as file:
    playlists = yaml.full_load(file)

    for playlist in playlists:
        for clip in playlist["clips"]:
            youtube_id = furl(clip['url']).args['v']
            id = '{id}_{start}_{end}'.format(
                id=youtube_id, start=clip["start"], end=clip["end"])

            cmd = 'bash load_clip.sh "{url}" "{start}" "{end}" "../8chunks/Resources/Videos/{id}" "../8chunks/Resources/Thumbnails/{id}"'.format(
                url=clip["url"], start=clip["start"], end=clip["end"], id=id)
            os.system(cmd)
