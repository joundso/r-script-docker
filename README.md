# Run your R script in a dockerized environment

- [Run your R script in a dockerized environment](#run-your-r-script-in-a-dockerized-environment)
  - [How to start](#how-to-start)
  - [Further information](#further-information)

## How to start

1. Clone this repo by using:

    ```bash
    git clone https://github.com/joundso/r-script-docker.git r-script-docker
    cd r-script-docker
    ```

2. Run the container (maybe you need to prefix `sudo`):

    ```bash
    docker-compose up --build
    ```

3. While the script has finished running, you should see a plot named `plot.pdf` in `[./R/out/]`(./R/out/)

4. Stop the environment by running `docker-compose down`.

## Further information

- Inspiration from this article: <https://www.statworx.com/de/blog/running-your-r-script-in-docker/>
- See also this gist: <https://gist.github.com/mjul/f26df39649995f8b35a4874bc32c65e4>
