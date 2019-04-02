workflow "On new changes" {
  on = "push"
  resolves = ["Deploy to GitHub Pages"]
}

action "Filter develop branch" {
  uses = "actions/bin/filter@24a566c2524e05ebedadef0a285f72dc9b631411"
  args = "branch develop"
}

action "Fetch git submodules" {
  uses = "srt32/git-actions@master"
  args = "git submodule update --init --recursive"
  needs = "Filter develop branch"
}

action "Build Hugo" {
  uses = "srt32/hugo-action@cf509857f219f3dbd979bdead5dc4317b92025d9"
  needs = "Fetch git submodules"
}

action "Deploy to GitHub Pages" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = ["Build Hugo"]
  env = {
    BUILD_DIR = "public/"
  }
  secrets = ["GH_PAT"]
}
