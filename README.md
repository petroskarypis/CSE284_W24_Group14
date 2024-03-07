# CSE284_W24_Group14 Comparison of Imputation Methods 

## Background: 

### Imputation methods considered:

We are considering two imputation methods for our comparison so far:
- **Beagle5**: This is the method discussed in lecture. It uses a Hidden Markov Model to model the probabiliy of an allele at a target marker. They use a modifed version of the method proposed in [Li and Stephens](https://doi.org/10.1016/j.ajhg.2018.07.015) with some modifications to reduce the state space size. This allows for their method to scale to larger reference panels. 
- **IMPUTE2**: Another HMM-based tool used for imputation developed by Oxford.

Beagles fits a full joint model to all individuals at all SNPs, while IMPUTE2 modeling the study individuals independently rather than
jointly. (according to the IMPUTE paper: B. N. Howie, P. Donnelly, and J. Marchini (2009) A flexible and accurate genotype imputation method for the next generation of genome-wide association studies. PLoS Genetics 5(6): e1000529 [Open Access Article])

We are primarily comparing the runtime and accuracy of the imputation methods. According to exisiting literature the performance between the two approaches should be similar- the main expected difference will be in the runtime. We will be using the example 23andMe data from the examples and the 1000 Genomes Phase 3 data as our reference panel. The data is phased before being imputed by using ShapeIT2, we used the pre-phased data from `prs-exercise`. 

## Relevant Benchmarking Scripts:

The relevant code for benchmarking the speed of Beagle can be found [here](beagle/). 

## Results so far:

Got the beagle result
Converted the unphased sample to plink and oxford IMPUTE format 

## Remaining work:

The major remaining work for the last week is coming up with a meaningful metric for quality for the imputations. 
