# Docker image with STM32 development support

STM32CubeCLT

Toolset for third-party integrated development environment (IDE) providers,
allowing the use of STMicroelectronics proprietary tools within their own IDE
frameworks.

## Versions

CubeClt Version | Docker image
-- | --
`st-stm32cubeclt_1.19.0_25876_20250729_1159_amd64.deb_bundle.sh.zip` | `parrotrueper/stm32cubeclt:1.19.0`
`0b57d9f99958d3783f0121cd5a63823b` | -
st-stm32cubeclt_1.20.0_26822_20251117_1245_amd64.deb_bundle.sh.zip | `parrotrueper/stm32cubeclt:1.20.0`
a350924454794970c55ad8383f88eab0 | -

## Using the Docker Hub image

`parrotrueper/stm32cubeclt:latest`

The toolchain installs in the default `/opt/st` directory.

## Building the Docker image locally

* Download the official STN32CubeCLT from file from the [ST website](www.st.com)
for example: `st-stm32cubeclt_1.19.0_25876_20250729_1159_amd64.sh.zip`.
* Place the zip at the root fo this repository.
* Get the md5sum of the downloaded file `md5sum <filename>` and update
`.env` accordingly
* On a terminal run `ci/test`

### Running the image

`docker run --rm -it <image name> /usr/bin/bash`

where image name is:

* `stm32cubeclt:latest` for local builds
* `parrotrueper/stm32cubeclt:latest`

## Push to Docker HUB

```shell
docker login -u <username>
docker image tag <local image name:tag> <docker hub namespace>/<image name:tag>
docker image push -a <docker hub namespace>/<image name>
```
