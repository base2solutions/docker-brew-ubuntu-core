# B2 Ubuntu Specifics
This is simply a fork of the official Ubuntu linux repository used to create the images that land on Docker hub. We use this fork to ensure images running on our cluster are built from a known, signed source. The only modifications made support tagging images unique to our registry.

The only branch we care about is `dist-amd64`, and it should be used as the base.

## Updating
1. Make sure you have added the upstream repo.
```
git remote add upstream https://github.com/tianon/docker-brew-ubuntu-core.git
```
2. Fetch the upstream.
```
git fetch upstream
```
3. Merge the upstream to `dist-amd64`.
```
git checkout dist-amd64
git merge upstream/dist-amd64
```
4. Push the changes to this repo.
```
git push
```

## Building
A build script has been created to build (as of this writing) LTS verions of Ubuntu 14.04.5, 16.04, and 18.04, as well as the latest 18 verion (currently 18.10). Provide the base URL of the repository as an argument while running.

Example:
```
[mattbrewster@mbp ~/dev/docker-brew-ubuntu-core (dist-amd64)]$ ./build.sh -r registry2.base2d.com/ops
```

Once built, use the normal pushing process documented in the Internal Devops repo.

## Repos
The B2 Ubuntu repo is located at `registry2.base2d.com/ops/ubuntu`.
