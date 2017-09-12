# Star Track
> Because manually typing your time tracking is for barbarians

## What does it do?
Creates a time tracking entry on your time tracker (currently only Freckle because I use Freckle) and fill it's description with data taken from you task manager (currently only Wunderlist because I use Wunderlist).

## How do I...?
1. `gem install star_track`
2. `touch ~/.star_track.yaml`
3. Fill the `.star_track.yaml` configuration file with your data (sample below)
4. `star_track help` for more info, `star_track 8:00` to log 8 hours
5. Profit $$$

## Configuration example
```yaml
freckle:
  token:      "e3b0c44298fc1c149afbf4c8996fb92427a41e4649b934ca495991b7852b855"
  project_id: 291342
wunderlist:
  list_name:    "My Work List"
  client_id:    "e181349b16af3a629"
  access_token: "5fd924625f6ab16a19cc9807c7c506ae1813490e4ba675f843d50e0baacdb8"
```

## That's lame...
This is just a personal script turned into gem ¯\\\_(ツ)_/¯
