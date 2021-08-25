To build the image:
```
sudo docker build -t redteam/recon:latest -f Dockerfile-recon .
```
To deploy the recon-container:
```
sudo docker run --name redteam_recon --rm -v "$(pwd)"/output-vol:/home --network=host -i -t redteam/recon bash
```
