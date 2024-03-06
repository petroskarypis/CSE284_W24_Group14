#!/bin/bash

set -e

TARGETVCF=./misc/mgymrek_genome.vcf.gz

prefix=$(basename $TARGETVCF .vcf.gz)

# Fix the VCF file to all upper case
zcat ${TARGETVCF} | sed 's/a/A/g' | sed 's/t/T/g' | sed 's/g/G/g' | sed 's/c/C/g' | \
    bgzip -c > ${prefix}_fixcase.vcf.gz 
tabix -p vcf ${prefix}_fixcase.vcf.gz

# (Option 2) Impute using Beagle
eagle \
    --vcfRef=${prefix}_fixcase.vcf.gz \
    --vcfTarget=${prefix}_fixcase.vcf.gz \
    --geneticMapFile=../misc/genetic_map_hg19_withX.txt.gz \
    --outPrefix=${prefix}_imputed