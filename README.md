# R on Gcloud

This little project is aimed at those looking to start learning how to run R
workloads at scale on cloud servers. Specifically, the stack we utilize
in this example can be summarized as:

    R  + SparkR + sparklyr + Gcloud Dataproc + Gcloud Storage  

[Google Dataproc](https://cloud.google.com/dataproc/) is
Google's managed offering for `Hadoop` and `Spark` distributed computation at
scale.

The example `R` source code here provided reads `.csv` data containing movies
and user ratings, computes the average ratings for each movie, sorts them up,
and exports the result to a new file.

**IMPORTANT**: `R` source code works both locally and on the cloud.

Additionally, this project includes a series of `bash` scripts that automate the
setup and deployment of jobs to the Gcloud servers. Scrips are full of comments
that will hopefully guide you if you would like to know what exactly are the
necessary steps for the stack to operate.

I highly recommend watching [Nathan Stephens's talk in Spark Summit](https://www.youtube.com/watch?v=oItFZfzqqMY)
to get a the big picture of what  `SparkR` and `sparklyr` libraries have to
offer. Make sure to also checkout [this Google Cloud Labs video](https://www.youtube.com/watch?v=h1LvACJWjKc&feature=emb_logo)
to start off with `Google Dataproc`.

All `R` and `bash` scrips were developed/tested on:
* `Ubuntu 16.04` and `Ubuntu  18.0`
* `R 3.4`
* `Spark 2.4`
* `sparklyr 1.2`
* `Gcloud SDK 289.0`

## Dataset

The data (~300 MB) can be download from [Gdrive](https://drive.google.com/drive/folders/14Y1rSDP0GG4GFy5gI6bbmTKI1gqnEUaK?usp=sharing).
Make sure  to download the `.csv` files into the `data/` directory.

## Prerequirements

### 1. Register in Google Cloud Platform

Register a new email (doesn't need to be gmail) in [Google Cloud Platform](https://console.cloud.google.com)
to gain $300 worth of credit. Note that even though Gcloud grants credits at
start, you will be asked to provide billing information before being able to
make use of Gcloud services.

### 2. Install Gcloud command-line tools

To access gcloud commands in your local terminal, install Google Cloud SDK by
following the [official instructions](https://cloud.google.com/sdk/docs).
Make sure you run `gcloud init` at the  end of the installation process
so that your machine gets authorized to manage your Gcloud account.

## Setup

### 0. Install the required R libraries

The following command takes care for installing the user-specified libs:
```bash
./0_install_r_libs.sh
```
**NOTE**: If later on the projects depends on new libraries, make sure to
add them to `0_install_r_libs.sh` as this file will also be used to install
libraries on the remote Gcloud server (Spark server).

### 1. Create a new Gcloud project

To start working, it is necessary  to create a Gcloud project. This action
only executed once (the provided `bash` script verifies if the project exist before
trying to create it). Once a project is created, we can deploy a server:

```bash
./1_create_gcloud_project.sh
```

**IMPORTANT**: Make sure to login to [Gcloud Console](https://console.cloud.google.com), navigate to the "Billing" panel and link the newly created project to the billing account that you created in step 1 of the [Pre-requirements](#prerequirements) section.

### 2. Create a Gcloud Storage bucket and upload the dataset

Create some storage for the dataset and project-related files:
```bash
./2_create_gcloud_storage.sh
```

### 3. Deploy a Gcloud Server (Spark Server)

Start the server:
```bash
./3_deploy_gcloud_server.sh
```

**IMPORTANT**: If idle for 1 hour, the server will automatically shutdown.
Run the above command again to re-deploy the server. The amount of idle time
before shutdown is defined by `SHUTDOWN_AFTER` in `./0_set_gcloud_env.sh`.

## Submitting Jobs to Gcloud

The provided `bash` script will upload the content
of the `src/` directory to `Gcloud Storage` and requests the server (Spark
server) to execute it:

```bash
./4_submit_gcloud_job.sh
```

## Development

All the  R code necessary for the execution is expected to be under the  
`src/` directory. The `main.R` file is the entry point of the execution, and it
imports functions from the remaining files:

* `env.R`: Offers functions to define environment variables
needed during runtime.
* `io.R`: Hold all functions needed to load data either from
localhost or a remote location.
* `subroutines.R`: Contains all subroutines of heavy computation (data
wrangling, data sorting, aggregating, modeling, ...)
* `config.R`: Contains definitions for things like the paths to input/output
files, whether or not to executed the code on distributed mode, and whether
or not to print debug messages.

**NOTE**: Feel free to add more definitions to `config.R` if needed.


## Testing

The project also includes an example unittest for the
`subroutines.compute_mean_ratings()` function. To verify that all
unittest under the `scr/tests/` directory are passing, you can run:

```bash
./0_run_uittests.sh
```

**NOTE**: Although ideally every function should have a corresponding
unittest, perhaps its ideal to star by focusing on the subroutines.
If you add a new function `subroutines.R`, you can add its corresponding
test to `test_subroutines.R` and run the above command to obtains
the results.

## Useful Resources

* `SparkR` [manual](https://rdrr.io/cran/SparkR/man/) and [code examples](https://github.com/apache/spark/tree/master/examples/src/main/r).
* `sparklyr` on Rstudio [documentation](https://spark.rstudio.com/).
* [Unittesting in R](https://towardsdatascience.com/unit-testing-in-r-68ab9cc8d211).

## TODO

1. Add `Cloud SQL` as source/destination of data and modidy the `R` code create
Dataframes out of queries []
2. Add cluster configurations when creating a `Spark` session in `R` to ensure
high performance on the server side! []
3. Add diagram of how this looks stack looks/operates []
4. Add `bash` script to clean up Gcloud after the project on user command []
