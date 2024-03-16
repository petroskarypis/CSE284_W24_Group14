# CSE284_W24_Group14 Comparison of Imputation Methods 

## Background: 

### Imputation methods considered:

We are considering two imputation methods for our comparison so far:
- **Beagle5**: This is the method discussed in lecture. It uses a Hidden Markov Model to model the probabiliy of an allele at a target marker. They use a modifed version of the method proposed in [Li and Stephens](https://doi.org/10.1016/j.ajhg.2018.07.015) with some modifications to reduce the state space size. This allows for their method to scale to larger reference panels. 
- **IMPUTE2**: Another HMM-based tool used for imputation developed by Oxford.

Beagles fits a full joint model to all individuals at all SNPs, while IMPUTE2 modeling the study individuals independently rather than
jointly. (according to the IMPUTE paper: B. N. Howie, P. Donnelly, and J. Marchini (2009) A flexible and accurate genotype imputation method for the next generation of genome-wide association studies. PLoS Genetics 5(6): e1000529 [Open Access Article])

We are primarily comparing the runtime and memory of the imputation methods. According to exisiting literature the performance between the two approaches should be similar- the main expected difference will be in the runtime. We will be using the example 23andMe data from the examples and the 1000 Genomes Phase 3 data as our reference panel. The data is phased before being imputed by using ShapeIT2, we used the pre-phased data from `prs-exercise`. 

## Reference Data

Both imputation methods require reference panels. For Beagle we used the 1000 Genomes on Datahub. The relative paths to those files assume this code is being run on the datahub for the course. For the phased 1000 Genomes Phase 3 data in the formate for IMPUTE2 you will need to download it from [here](https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3.html). Unzip these files and up them in the [data](data/) directory, the relative paths for the IMPUTE2 script assumes the data is in that directory. 

## Running Imputations:

To run both imputation methods we provide two bash scripts. The code to run Beagle can be found in [run.sh](run.sh) and IMPUTE2 can be found in [impute2.sh](impute2.sh). To run either just type `bash {run, impute2}.sh`. 

## Benchmarking Time:

We include the `time` command before both imputation. The timing results are printed in the output of the bash scripts mentioned above.

## Benchmarking Memory Utilization:

We primarily used `top` to measure the memory utilized. To do this yourself open another terminal while the imputation is running and type `top`. The columns we are interested in are `VIRT` and `RES`, these are the total virtual memeory and total RAM reserved by the process. Refer to the right most column (`COMMAND`) to find the row corresponding to the running imputation. Beagle will be named `java` and IMPUTE2 will be `impute2`. Identifying the correct row will not be difficult on datahub as very few other processes will be running. 

## Results so far:

NA

## Remaining work:

NA
